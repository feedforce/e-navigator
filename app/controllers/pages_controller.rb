class PagesController < ApplicationController
  def index
  end

  def profile
    @user = User.find_by(:email => current_user.email)
  end

  def edit
    user = User.find_by(:email => current_user.email)
    user.update_attributes(:name => params[:post][:name], :birthday => params[:post][:birthday], :sex => params[:post][:sex], :school => params[:post][:school])
  end
end
