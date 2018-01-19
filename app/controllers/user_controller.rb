class UserController < ApplicationController

  def new
  end

  def create
    @user = User.new(
    email: params[:email],
    password: params[:password]
    )

    @user.save

    if @user
      session[:user_id] = @user.id
      redirect_to("/")
    else
      redirect_to("/user/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.birthday = params[:birthday]
    @user.sex = params[:sex]
    @user.school_name = params[:school_name]

    redirect_to("/")
  end
end
