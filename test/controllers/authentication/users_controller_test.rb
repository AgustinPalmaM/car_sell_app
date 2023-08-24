require "test_helper"

class Authentication::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create a new user" do
    assert_difference("User.count") do
      post users_url, params: { user: { username: 'pepin', email: 'pepin@gmail.com', password: '123456' } }
    end

    assert_redirected_to cars_path
  end


end