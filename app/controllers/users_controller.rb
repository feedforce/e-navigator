class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @users = User.where.not(id: current_user.id)
  end
end
