require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  setup do
    @user = users(:user)
    sign_in @user
  end
  
  test "should get show" do
    get :show
    assert_response :success
  end
end
