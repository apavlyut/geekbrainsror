class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate

  def authenticate
    redirect_to login_path unless signed_in?
  end

  def signed_in?
    current_user
  end
  helper_method :signed_in?

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id].present?
  end
  helper_method :current_user


end
