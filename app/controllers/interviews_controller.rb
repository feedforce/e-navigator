class InterviewsController < ApplicationController

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
    if Time.now < @interview.schedule
      flash[:danger] = '未来の時間を指定してください'
      redirect_to new_user_interview_path
    elsif @interview.save
      flash[:info] = "面接日程を作成しました"
      redirect_to user_interview_path(id: @interview)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def time_now(time)
    if Time.now < time
      flash[:danger] = '未来の時間を指定してください'
      render :new
    end
  end


  private

  def interview_params
    params.require(:interview).permit(:schedule)
  end

  def correct_user
  end

end
