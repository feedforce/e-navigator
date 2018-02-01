class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_info_params)
    redirect_to root_path, notice: 'プロフィールの変更を保存しました。'
  end

  private

  def user_info_params
    params.require(:user).permit(:email, :name, :birth_date, :gender, :school_name)
  end
end
