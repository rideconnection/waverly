class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  respond_to :html
  
  def index
    @users = @users.page(params[:page])
  end
  
  def show; end
  
  def new; end
  
  def edit; end

  def create
    flash[:notice] = 'User was successfully created.' if @user.save
    respond_with @user
  end
    
  def update
    flash[:notice] = 'User was successfully updated.' if @user.update_attributes(user_params)
    respond_with @user
  end
  
  def destroy
    flash[:notice] = 'User was successfully destroyed.' if @user.destroy
    respond_with @user
  end

  private
  
  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :administrator)
  end 
end
