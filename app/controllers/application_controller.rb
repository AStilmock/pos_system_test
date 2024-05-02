class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_login
  

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
