class InterviewsController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy, :update]

  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews.all
  end

  def show
    @interview = current_user.interviews.find(params[:id])
  end

  def new
    @interview = current_user.interviews.build
  end

  def create
    @interview = current_user.interviews.build(interview_params)
    if @interview.save
      flash[:info] = "面接日程を作成しました"
      redirect_to user_interview_path(id: @interview)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @interview.update_attributes(interview_params)
      flash[:success] = "面接時間を更新しました"
      redirect_to user_interview_path(id: @interview)
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    flash[:info] = "削除されました"
    redirect_to user_interviews_path
  end



  private

  def interview_params
    params.require(:interview).permit(:schedule)
  end

  def correct_user
    @interview = current_user.interviews.find_by(id: params[:id])
    redirect_to root_url if @interview.nil?
  end

end
