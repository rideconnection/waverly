class ClientAuthorizationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  respond_to :html

  def index
    @client_authorizations = @client_authorizations.order(created_at: :desc).page(params[:page])
  end
  
  def show; end
  
  def create
  end
end
