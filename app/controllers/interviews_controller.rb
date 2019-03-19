class InterviewsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews.order('start_datetime ASC')
  end

  def show
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @interview = @user.interviews.build
  end

  def create
    user = User.find(params[:user_id])
    @interview = user.interviews.build(interview_params)
    @interview.save!
    redirect_to user_interview_path(user_id: user.id, id: @interview.id), notice: "面接が作成されました。"
  end

  def edit
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    interview = user.interviews.find(params[:id])
    interview.update!(interview_params)
    redirect_to user_interview_path(user_id: user.id, id: interview.id), notice: "面接が更新されました。"
  end

  def destroy
    #interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to user_interviews_path(user_id: @interview.user.id), notice: "面接日程を削除しました。"
  end

  private

  def interview_params
    params.require(:interview).permit(:start_datetime, :status)
  end

  def correct_user
    @interview = current_user.interviews.find_by(id: params[:id])
    unless @interview
      redirect_to root_url
    end
  end
end
