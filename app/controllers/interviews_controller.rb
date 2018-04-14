class InterviewsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_interview, only: [:edit, :update, :destroy]
  before_action :ensure_correct_user_to_create, only: [:new, :create]
  before_action :ensure_correct_user_to_edit_and_delete, only: [:edit, :update, :destroy]

  def index
    @interviews = @user.interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = @user.interviews.new(interview_params)
    if @interview.save
      flash[:success] = "面接日時を登録しました"
      redirect_to user_interviews_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @interview.update(interview_params)
      redirect_to user_interviews_path
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_path
  end

  def ensure_correct_user_to_create
    if @user.id != current_user.id
      flash[:notice] = "他のユーザーの面接日時の登録は許可されていません"
      redirect_to users_path
    end
  end

  def ensure_correct_user_to_edit_and_delete
    if @interview.user_id != current_user.id
      flash[:notice] = "他のユーザーの面接日時の編集及び削除は許可されていません"
      redirect_to users_path
    end
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_interview
    @interview = Interview.find_by(id: params[:id])
  end

  private

    def interview_params
      params.require(:interview).permit(:datetime)
    end
end
