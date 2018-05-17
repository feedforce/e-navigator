class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @current_user=User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user ==nil
      flash[:notice]="ログインしてください"
      redirect_to("/users/form")
    end
  end

end
