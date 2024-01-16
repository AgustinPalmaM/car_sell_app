require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = User.last
  end
  test "welcome" do
    mail = UserMailer.with(user: @user).welcome
    assert_equal "Welcome to Car Sell App", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["admin@carsellapp.com"], mail.from
    assert_match "Hey #{@user.username}, welcome to car sell app, i hope you can sell your car with us!", mail.body.encoded
  end

end
