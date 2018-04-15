class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.where.not(id: current_user.id).order(id: 'asc')
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end
end
