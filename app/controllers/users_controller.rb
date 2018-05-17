class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:usertable, :profile]}


  def form
  end

  def profile
    @user = User.find_by(id: params[:id])
  end

  def profile_register
    @user=@current_user
    @user.name = params[:name]
    @user.email = params[:email]
    ymd = (params[:year] + params[:month] + params[:day]).to_date
    date_format = "%Y%m%d"
@user.age = (Date.today.strftime(date_format).to_i - ymd.strftime(date_format).to_i) / 10000
    @user.sex = params[:sex]
    @user.belonging = params[:belonging]
    if @user.save
      flash[:notice] = "登録しました"
      redirect_to("/users/#{session[:user_id]}/usertable")
    else

      render("users/profile")
    end
  end

  def user_register
  end

  def usertable
    @users=User.all
  end

  def login
    @user = User.find_by(email: params[:email],password:params[:password])
    if @user
      session[:user_id]=@user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{session[:user_id]}/usertable")
    else
      @error_message="メールアドレスもしくはパスワードが違います"
      render("users/form")
    end
  end

  def regist
    @user =User.new(email: params[:email],password: params[:password])
    @user.password_confirmation=params[:password_confirmation]
    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "登録しました"
      redirect_to("/users/#{session[:user_id]}/usertable")
    else
      render("users/user_register")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/users/form")
  end

end
