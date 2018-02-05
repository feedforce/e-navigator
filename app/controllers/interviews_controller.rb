class InterviewsController < ApplicationController
  def index
    @interviews = current_user.interviews.order(" start_time ASC")
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to user_interviews_path, notice: "面接日程を追加しました。"
    else
      render :new
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:start_time).merge(user_id: params[:user_id])
  end
end
