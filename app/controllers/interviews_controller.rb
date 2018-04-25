class InterviewsController < ApplicationController
  before_action :params_user_interview, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @users = User.where.not(id: current_user)
    @interviews = @user.interviews.all
  end

  def show
  end

  def new
    @interview = current_user.interviews.build
  end

  def create
    @interview = current_user.interviews.build(interview_params)
    if @interview.save
      flash[:info] = '面接日程を作成しました'
      redirect_to user_interview_path(id: @interview)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @interview.update(interview_params)
      if params[:interview][:availability]
        @interviews = @user.interviews.where.not(id: params[:id])
        @interviews.update_all(availability: Interview.availabilities[:rejected])
        flash[:success] = '面接日程が確定しました'
        return redirect_to user_interviews_path
      end
      flash[:success] = '面接時間を更新しました'
      redirect_to user_interview_path(id: @interview)
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    flash[:info] = '削除しました'
    redirect_to user_interviews_path
  end

  private

  def params_user_interview
    @user = User.find(params[:user_id])
    @interview  = @user.interviews.find_by(id: params[:id])
  end

  def interview_params
    params.require(:interview).permit(:schedule, :availability)
  end
end
