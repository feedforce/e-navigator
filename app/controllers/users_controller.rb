class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,           only: [        :edit, :update, :destroy]
  before_action :set_user,               only: [        :edit, :update, :destroy]

  def index
    @users = User.alive_records.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "登録いたしました"
      redirect_to users_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "更新いたしました"
      redirect_to users_path
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "削除いたしました"
    @user.all_destroy
    redirect_to root_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :sex, :birthday, :school, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:danger] = '他のユーザー情報は変更できません。'
        redirect_to root_url
      end
    end
end
