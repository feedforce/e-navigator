class UsersController < ApplicationController

  def index
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email],
      password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました。"
      redirect_to("/users/#{session[:user_id]}/profile")
    else
      render("users/login_form")
    end
  end

  def profile
    @user = User.find_by(id: params[:id])
  end

  def new
  end


  def create
    @user = User.new(name: params[:name],
    email: params[:email],
    school_name: params[:school_name],
    age: params[:age],
    sex: params[:sex],
    password: params[:password])
     if @user.save
       session[:user_id] = @user.id
       flash[:notice] = "登録に成功しました"
       redirect_to("/users/#{@user.id}/profile")
     else
       render("users/new")
     end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @user.name = params[:name]
    @user.age = params[:age]
    @user.sex = params[:sex]
    @user.school_name = params[:school_name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = "更新に成功しました"
      redirect_to("/users/#{@user.id}/profile")
    else
      render("users/edit")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end



end
