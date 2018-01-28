class InterviewsController < ApplicationController

  def index
    @user       = User.find(current_user.id)
    @interviews = Interview.where(user_id: current_user.id)
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.create(create_params)
    if @interview.save
      redirect_to user_interviews_path, notice: '日程を作成しました'
    else
      redirect_to user_interviews_path, alert: '失敗しました。やり直して下さい'
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    if Interview.update(params[:id], update_params)
      redirect_to user_interviews_path, notice: '日程情報を修正しました'
    else
      redirect_to user_interviews_path, alert: '失敗しました。やり直して下さい'
    end
  end

  def destroy
    interview = Interview.find(params[:id])
    if interview.destroy
      redirect_to user_interviews_path, notice: '日程を削除しました'
    else
      redirect_to user_interviews_path, alert: '失敗しました。やり直して下さい'
    end
  end

  private
  def create_params
    params.require(:interview).permit(:interview_datetime).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:interview).permit(:interview_datetime)
  end
end
