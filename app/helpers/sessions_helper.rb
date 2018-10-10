module SessionsHelper

  # 登入指定的用户
  def log_in(user)
    session[:user_id] = user.id
  end
end