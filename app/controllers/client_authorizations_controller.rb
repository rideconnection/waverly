class ClientAuthorizationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  respond_to :html

  def index
    case params[:filter].try(:to_sym)
    when :all
      # no-op
    when :read
      @client_authorizations = @client_authorizations.read
    else
      # default
      @client_authorizations = @client_authorizations.unread
    end
    @client_authorizations = @client_authorizations.order(created_at: :desc).page(get_current_page)
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
  
  private
  
  def get_current_page
    current_page = params[:page].try(:to_i) || 1
    total_pages = @client_authorizations.page(1).total_pages
    if current_page > total_pages
      if total_pages == 1
        params.delete :page
      else
        params[:page] = total_pages
      end
    end
    params[:page]
  end
end
