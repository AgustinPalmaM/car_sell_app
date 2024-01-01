require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:agustin)
  end

  test "should get user url" do
    get user_url(@user.username)
    assert_response :success
  end
end