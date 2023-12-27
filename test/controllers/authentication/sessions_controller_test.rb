require "test_helper"

module Authentication
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    def setup
      @user = users(:agustin)
    end

    test "should get new" do
      get new_session_url
      assert_response :success
    end

    test "it should login an user by email" do
      post sessions_url, params: { login: @user.email, password: "123456" }
      assert_redirected_to cars_path
    end

    test "it should login an user by username" do
      post sessions_url, params: { login: @user.username, password: "123456" }
      assert_redirected_to cars_path
    end
  end
end
