class InterviewsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @interviews = @user.interviews
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @interview = Interview.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @interview = @user.interviews.new(interview_params)
    if @interview.save
      flash[:success] = "面接日時を登録しました"
      redirect_to user_interviews_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @interview = @user.interviews.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @interview = @user.interviews.find_by(id: params[:id])
    if @interview.update(interview_params)
      redirect_to user_interviews_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @interview = @user.interviews.find_by(id: params[:id])
    @interview.destroy
    redirect_to user_interviews_path
  end

  private

    def interview_params
      params.require(:interview).permit(:datetime)
    end
end
