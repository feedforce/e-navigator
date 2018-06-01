class SessionsController < MasterController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインしました。'
      redirect_to users_path
    else
      flash.now[:danger] = 'ユーザー名またはパスワードが違います。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

    def login(email, password)
      @user = User.find_by(email: email)
      if @user && @user.authenticate(password)
        session[:user_id] = @user.id
        return true
      else
        return false
      end
    end
end
