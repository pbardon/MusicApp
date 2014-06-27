include SessionsHelper

class UsersController < ApplicationController

  def index
    @users = User.all
    render 'index'
  end

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render 'show'
  end

  def user_params
    params.require(:user).permit(:email, :session_token, :password)
  end
end
