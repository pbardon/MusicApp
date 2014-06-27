module SessionsHelper

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?(user)
    unless user.nil?
      user.session_token == session[:session_token]
    end
  end

  def log_in_user!
    @user = User.find_by_credentials(session_params[:email],
                                     session_params[:password])

    @user.reset_session_token
    session[:session_token] = @user.session_token

  end


end
