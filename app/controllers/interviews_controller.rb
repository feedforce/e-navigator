class InterviewsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_interview, only: [:edit, :update, :destroy, :approve]
  before_action :ensure_correct_user_to_create, only: [:new, :create]
  before_action :ensure_correct_user_to_update_and_delete, only: [:edit, :update, :destroy]

  # GET /users/:user_id/interviews
  def index
    @interviews = @user.interviews.order(datetime: 'asc')
  end

  # GET /users/:user_id/interviews/new
  def new
    @interview = Interview.new
  end

  # POST /users/:user_id/interviews
  def create
    @interview = @user.interviews.new(interview_params)
    if @interview.save
      flash[:success] = "面接日時を登録しました"
      redirect_to user_interviews_path
    else
      render :new
    end
  end

  # GET /users/:user_id/interviews/:id/edit
  def edit
  end

  # PATCH /users/:user_id/interviews/:id
  def update
    @interview.update(interview_params)
    flash[:success] = "面接日時を変更しました"
    redirect_to user_interviews_path
  end

  # DELETE /users/:user_id/interviews/:id
  def destroy
    @interview.destroy
    flash[:success] = "面接日時を削除しました"
    redirect_to user_interviews_path
  end

  # POST /users/:user_id/interviews/:id/approve
  def approve
    @interview.update(status: 1)
    # 以下、承認した日時以外を否認状態にする
    interviews = Interview.where(user_id: @interview.user_id).where.not(id: @interview.id)
    interviews.each do |interview|
      interview.update(status: 2)
    end
    flash[:success] = "面接日時を承認しました"
    redirect_to user_interviews_path
  end

  def ensure_correct_user_to_create
    if @user.id != current_user.id
      flash[:notice] = "他のユーザーの面接日時の登録は許可されていません"
      redirect_to users_path
    end
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def ensure_correct_user_to_update_and_delete
    if @interview.user_id != current_user.id
      flash[:notice] = "他のユーザーの面接日時の編集及び削除は許可されていません"
      redirect_to users_path
    end
  end

  private

    def interview_params
      params.require(:interview).permit(:datetime)
    end
end
