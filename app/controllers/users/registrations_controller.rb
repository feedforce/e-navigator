class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birth, :gender, :univ_name])
  end

  def update_resource(require, params)
    resource.update_without_password(params)
  end
end
