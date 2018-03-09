class ProfilesController < ApplicationController

  def index
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to :root, notice: 'Your profile is successfully saved'
    else
      redirect_to :root, notice: 'Unsuccessfully saved'
    end
  end

  def edit
    @profile = Profile.edit
  end

  def update
  end

  private

  def profile_params
    params.require(:profile).permit(:email, :name, :birth_year, :birth_month, :birth_day, :sex, :school)
  end

end
