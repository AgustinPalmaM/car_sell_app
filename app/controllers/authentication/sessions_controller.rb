module Authentication
  class SessionsController < ApplicationController
    skip_before_action :protect_pages
    def new; end

    def create
      @user = User.find_by("email = :login OR username = :login", { login: params[:login] })

      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to cars_path, notice: t(".login_ok")
      else
        redirect_to new_session_path, alert: t(".login_error")
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to cars_path, notice: t(".signed_out")
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
end
