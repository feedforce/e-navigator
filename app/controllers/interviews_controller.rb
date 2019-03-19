class InterviewsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews.order('start_datetime ASC')
  end

  def show
    @user = User.find(params[:user_id])
    @interview = @user.interviews.find(params[:id])
  end

  def new
    @interview = current_user.interviews.build
  end

  def create
    @interview = current_user.interviews.build(interview_params)
    @interview.save!
    redirect_to user_interview_path(current_user, @interview), notice: "面接が作成されました。"
  end

  def edit
  end

  def update
    @interview.update!(interview_params)
    redirect_to user_interview_path(current_user.id, @interview), notice: "面接が更新されました。"
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_path(@interview.user), notice: "面接日程を削除しました。"
  end

  private

  def interview_params
    params.require(:interview).permit(:start_datetime, :status)
  end

  def correct_user
    @interview = current_user.interviews.find_by(id: params[:id])
    unless @interview.present?
      redirect_to root_url
    end
  end
end
