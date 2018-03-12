class ProfilesController < ApplicationController

  # before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update]

  def index
  end

  def new
    @profile = Profile.new
    @user_email = current_user.email
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to edit_profile_path(current_user.id), notice: 'Your profile is successfully saved'
    else
      redirect_to edit_profile_path(current_user.id), notice: 'Unsuccessfully saved'
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to edit_profile_path(current_user.id), notice: 'プロフィール更新が完了しました'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:email, :name, :birth_year, :birth_month, :birth_day, :sex, :school).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
