# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  def profile_edit
 
  end
  
  def index
    @users = User.all
  end
  
  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
	  redirect_to action: :index
    else
      render "profile_edit"
    end
  end
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  private
    def sign_up_params
    params.require(:user).permit( :username,
                                  :birthdate,
                                  :gender,
                                  :school,
                                  :email,
                                  :password,
                                  :password_confirmation)
    end
    
    def account_update_params
    params.require(:user).permit( :username,
                                  :birthdate,
                                  :gender,
                                  :school,
                                  :email,
                                  :password,
                                  :password_confirmation)
    end
  
end
