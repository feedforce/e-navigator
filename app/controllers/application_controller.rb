class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def require_sign_in 
    return if sign_in?
    swal{ info 'ログインしてくださいませ' }
    redirect_to "/"
  end
end
