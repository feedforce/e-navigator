class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_set, only: [:edit, :update]

  def index
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(update_params)
      if @user.update(update_params)
        redirect_to root_path
      else
        render "edit"
      end
  end

private

  def user_set
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:email, :name, :birthday, :sex, :school)
  end
end
