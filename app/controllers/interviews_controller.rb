class InterviewsController < ApplicationController
  def index
    @user = current_user
    @interviews = @user.interviews.order("interview_date ASC")
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

  def edit
    @user = current_user
    @interview = Interview.find(params[:id])
  end

  def update
    @user = current_user
    @interview = Interview.find(params[:id])
    if  @interview.update(interview_params)
      redirect_to user_interviews_url
    else
      render 'edit'
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:interview_date).merge(user_id: params[:user_id])
  end
end
