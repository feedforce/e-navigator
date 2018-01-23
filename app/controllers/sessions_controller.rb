class SessionsController < ApplicationController
  def new 
    @user = User.new
  end
  
  def create
    user = User.find_by(email: session_params[:email].downcase) # 入力されたEmailを持つユーザが存在するか?
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      swal { error 'ログインに失敗いたしました' }
      render :new
    end
  end
  
  def destroy
    session.clear  # session[:user:id] = nil 
    redirect_to "/"
  end
  
  private
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
