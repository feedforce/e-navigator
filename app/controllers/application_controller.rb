class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_corrent_user

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :sex, :birthday, :school, :　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  
  def set_corrent_user
    current_user ||= User.find_by(id: session[:user_id])
  end
end