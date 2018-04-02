class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!
	def after_sign_in_path_for(resource)
		user_path(@user)
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	def configure_permitted_parameters
		added_attrs = [ :school, :name, :email, :password, :password_confirmation, :sex, :birthday　]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
		devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	end
end
