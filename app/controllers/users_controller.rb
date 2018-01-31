class UsersController < ApplicationController
  def index
  end
  def edit
    @user = current_user
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :birthday, :sex, :school)
  end
end
