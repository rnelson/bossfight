require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get password" do
    get :password
    assert_response :success
  end

end
