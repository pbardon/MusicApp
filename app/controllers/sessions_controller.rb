include SessionsHelper

class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def create
    log_in_user!

    redirect_to user_url(@user)
  end

  def destroy
    session[:session_token] = nil

    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
