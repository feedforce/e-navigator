class InterviewsController < ApplicationController
  before_action :set_user, except: :destroy
  before_action :set_interview, only: [:edit, :update, :destroy, :setup]

  def index
    @interviews = @user.interviews.order("interview_date")
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      flash[:success] = "Interview created."
      redirect_to user_interviews_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if  @interview.update(interview_params)
      flash[:success] = "Interview updated."
      redirect_to user_interviews_url
    else
      render 'edit'
    end
  end

  def destroy
    @interview.destroy
    flash[:success] = "Interview deleted."
    redirect_to user_interviews_url
  end

  def setup
    others = Interview.where(user_id: @user.id).where.not(id: params[:id])
    if @interview.update(status: 1)
      others.update_all(status: 2)
      flash[:success] = "Interview has been set."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:interview_date).merge(user_id: params[:user_id])
  end
end
