class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User Update !"
      redirect_to edit_user_path(@user)
    else
      flash[:danger] = "Try Again !"
      render @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :birthdate, :gender, :school)
  end

end
