class UsersController < ApplicationController
  skip_before_action :protect_pages, only: %i[show]
  def show
    @user = User.find_by!(username: params[:username])
    @pagy, @cars = pagy_countless(FindCars.new.call({user_id: @user.id}).load_async, items: 4)
  end
end