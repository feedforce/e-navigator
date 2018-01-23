class InterviewsController < ApplicationController
  def index
    @interviews = current_user.interviews.order("interview_date ASC")
  end

  def new
    @user = current_user
    @interview = Interview.new
  end

  def create
    @user = current_user
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to user_interviews_url
    else
      render 'new'
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:interview_date).merge(user_id: params[:user_id])
  end
end
