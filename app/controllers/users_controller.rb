class UsersController < ApplicationController
  skip_before_action :protect_pages, only: %i[show]
  def show
    @user = User.find_by!(username: params[:username])
  end
end
