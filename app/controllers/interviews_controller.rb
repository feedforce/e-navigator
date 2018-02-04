class InterviewsController < ApplicationController

  def index
    @interviews = Interview.where(user_id: current_user.id).order(interview_datetime: :asc)
  end

  def new
    @interview = Interview.new
  end

  def create
    if Interview.create(create_params)
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
    if Interview.destroy(params[:id])
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
