class InterviewsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews.order('created_at DESC')
  end

  def show
  end

  def new
    @interview = @user.interviews.build
  end

  def create
    @interview = @user.interviews.build(interview_params)
    if @interview.save
      flash[:success] = '面接が作成されました'
      redirect_to @interview
    else
      flash.now[:danger] = '面接が作成されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @interview.update(interview_params)
      flash[:success] = '面接が更新されました'
      redirect_to @interview
    else
      flash.now[:danger] = '面接が更新されませんでした'
      render :edit
    end
  end

  def destroy
    @interview.destroy
    flash[:success] = '面接が削除されました'
    redirect_to user_interviews_path(@user)
  end

  private

  def set_user
    @user = current_user
  end

  def set_interview
    set_user
    @interview = @user.interviews.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:interview_date, :interview_status)
  end

end
