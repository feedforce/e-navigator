class UsersController < ApplicationController

  def index
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path, notice: "プロフィールを更新しました"
    else
      redirect_to users_path, alert: "プロフィール更新に失敗しました"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :birthday, :sex, :school_name)
  end

end
