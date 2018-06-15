class InterviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_interview, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:new, :edit]

  def index
    @interviews = Interview.where(user_id: params[:user_id]).alive_records.page(params[:page]).per(10)
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      flash[:success] = "登録いたしました"
      redirect_to user_interviews_path(user_id: current_user.id)
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @interview.update(interview_params)
      flash[:success] = "更新いたしました"
      redirect_to user_interviews_path(user_id: current_user.id)
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    flash[:success] = "削除いたしました"
    @interview.all_destroy
    redirect_to user_interviews_path(user_id: current_user.id)
  end

  private
    def set_user
    @user = User.find(params[:user_id])
    end

    def set_interview
      @interview = Interview.find(params[:id])
    end

    def interview_params
      params.require(:interview).permit(:start_date).merge(user_id: params[:user_id])
    end

    def correct_user
      @user = User.find(params[:user_id])
      unless @user == current_user
        flash[:danger] = "他のユーザー情報は変更できません。"
        redirect_to root_url
      end
    end
end
