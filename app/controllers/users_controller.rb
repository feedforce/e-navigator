class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to users_path
    else
      redirect_to edit_user_path(id: current_user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :birthday, :sex, :school)
  end
end
