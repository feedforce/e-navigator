class PagesController < ApplicationController
  def index
  end

  def profile
    @user = User.find_by(:email => params[:email])
  end

  def edit
    @user = User.find_by(:email => params[:email])
    user.update_attributes(:point => '303', :flag => false)
  end
end
