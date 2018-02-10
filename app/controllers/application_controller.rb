class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :schoolname, :sex, :birth_date])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :schoolname, :sex, :birth_date]) 
  end
end
