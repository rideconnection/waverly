class SessionTimeoutController < ApplicationController
  skip_authorization_check
  before_action :authenticate_user!
  prepend_before_action :skip_trackable, only: :check
  
  respond_to :js
  
  def check
    last_request_at = user_session['last_request_at']
    timeout_time = last_request_at + Rails.configuration.devise.timeout_in
    timeout_in = timeout_time - Time.current.to_i
    render :json => {
      'last_request_at' => last_request_at,
      'timeout_in' => timeout_in,
    }
  end

  def touch
    render :text => 'OK'
  end
  
  private
  
  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end
end
