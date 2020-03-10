# frozen_string_literal: true

class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def new
    @interview = current_user.interviews.build
  end

  def create
    @interview = current_user.interviews.build(interview_params)
    if @interview.save
      flash[:success] = '面接を予約しました'
      redirect_to user_interviews_path(current_user)
    else
      flash[:danger] = '面接の予約に失敗しました。（過去の日付は選択できません）'
      render 'new'
    end
  end

  def index; end

  def edit; end

  def update; end

  def destroy; end

  private

  def interview_params
    params.require(:interview).permit(:interviewer_id, :schedule)
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
