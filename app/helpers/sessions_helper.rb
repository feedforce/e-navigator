module SessionsHelper
  def sign_in?
    !!session[:user_id] # ログインしていればtrue
  end
  
  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
  

end
