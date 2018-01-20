class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    @user.update(user_params) if @user.id = current_user.id
    if @user.save
      redirect_back(fallback_location: "")
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :birthday, :gender, :school)
  end
end
