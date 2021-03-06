class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_access
  	if session[:user_id].nil?
  		redirect_to login_path, notice: "You must be logged in. Username: admin, password: admin"
  	end
  end

  def current_user
  	@user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
