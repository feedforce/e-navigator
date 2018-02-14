class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def index
    @users = User.where.not(id: current_user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated."
      redirect_to users_url
    else
      render edit_user_path(@user)
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
