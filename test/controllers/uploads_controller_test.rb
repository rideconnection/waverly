require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  setup do
    @user = users(:user)
    sign_in @user
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    get :create
    assert_response :success
  end
end
