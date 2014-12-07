class IndexController < ApplicationController
  before_action :authenticate_user!
  skip_authorization_check
  
  respond_to :html

  def show; end
end
