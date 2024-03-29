require "test_helper"

module Authentication
  class UsersControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get new_user_url
      assert_response :success
    end

    test "should create a new user" do
      stub_request(:get, "http://ip-api.com/json/127.0.0.1").
        to_return(status: 200, body: {
          status: "fail"
        }.to_json, headers: {})
      assert_difference("User.count") do
        post users_url,
             params: { user: { username: "pepin", email: "pepin@gmail.com", password: "123456" } }
      end

      assert_redirected_to cars_path
    end
  end
end
