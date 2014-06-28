include SessionsHelper

class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = (User.find_by_credentials(session_params[:email],
                                          session_params[:password]))

    if @user.nil?
      @user = User.new(email: session_params[:email])
      flash.now[:errors] = "Invalid login"
      render 'new'
    else
      log_in_user!(@user)
      redirect_to bands_url
    end
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
