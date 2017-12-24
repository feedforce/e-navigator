class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  DEVISE_PERMISSIBLE_ATTRIBUTES = %i(username birthday sex schoolname)

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: DEVISE_PERMISSIBLE_ATTRIBUTES)
    devise_parameter_sanitizer.permit(:account_update, keys: DEVISE_PERMISSIBLE_ATTRIBUTES)
  end

  def after_sign_in_path_for(resource)
    '/users/edit'
  end
end
