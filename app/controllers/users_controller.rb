class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "プロフィールを更新しました。"
    else
      render edit_user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :birthday, :sex, :school)
  end

  def set_user
    @user = current_user
  end
end
