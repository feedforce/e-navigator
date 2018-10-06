class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    '/users'
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :gender, :school])
    end
end
