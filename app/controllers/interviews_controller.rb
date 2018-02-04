class InterviewsController < ApplicationController
  before_action :set_user, except: :destroy
  before_action :set_interview, only: [:edit, :update, :destroy]

  def index
    @interviews = @user.interviews.order("interview_date")
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      flash[:success] = "Interview created."
      redirect_to user_interviews_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if  @interview.update(interview_params)
      flash[:success] = "Interview updated."
      redirect_to user_interviews_url
    else
      render 'edit'
    end
  end

  def destroy
    @interview.destroy
    flash[:success] = "Interview deleted."
    redirect_to user_interviews_url
  end

  private

  def set_user
    @user = current_user
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:interview_date).merge(user_id: params[:user_id])
  end
end
