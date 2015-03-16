class ClientAuthorizationQuery
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :read_status_filter, :name_filter, :page

  def persisted?; false; end

  def initialize(params, page)
    params ||= {}
    @read_status_filter = (params[:read_status_filter] || "unread")
    @name_filter = params[:name_filter]
    @page = page.try(:to_i) || 1
  end

  def apply_conditions(client_authorizations)
    case @read_status_filter.try(:to_sym)
    when :all
    when :read
      client_authorizations = client_authorizations.read
    when :unread
      client_authorizations = client_authorizations.unread
    end
    client_authorizations = client_authorizations.by_name(@name_filter) if @name_filter.present?
    client_authorizations = client_authorizations.order(created_at: :desc).page(get_current_page(client_authorizations))
    client_authorizations
  end

  def filter_state
    if @read_status_filter = "all" 
      @filter_state = nil
    else
      @filter_state = @read_status_filter
    end
  end

  def get_current_page(client_authorizations)
    total_pages = client_authorizations.page(1).total_pages
    if @page > total_pages
      if total_pages == 1
        return nil
      else
        return total_pages
      end
    else
      return @page
    end
  end
end

class ClientAuthorizationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  respond_to :html

  def index
    @query = ClientAuthorizationQuery.new params[:q], params[:page]
    @client_authorizations = @query.apply_conditions(@client_authorizations)
  end
  
  def show; end
  
  def mark_as_read
    if params[:read].try(:to_i) == 1
      @client_authorization.read_at = Time.current
      @client_authorization.reader = current_user
      action_notice = "read"
    else
      @client_authorization.read_at = nil
      @client_authorization.reader = nil
      action_notice = "unread"
    end

    if @client_authorization.save
      redirect_to :back, params: params.slice(:filter, :page), notice: "Client authorization #{@client_authorization.prime} marked as #{action_notice}"
    else
      redirect_to :back, params: params.slice(:filter, :page), alert: "Client authorization #{@client_authorization.prime} could not be marked as #{action_notice}"
    end
  end
  
end
