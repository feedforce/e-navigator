class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
    else
      # 保存失敗時のエラーメッセージ（詳細は表示しない仕様にしました）
      swal { error 'ユーザ情報の登録に失敗しました' }
    end
    redirect_to "/"
  end
  
  def edit 
  end
  
  def update
   @user = User.find(params[:id])
   if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
      swal{ success 'ユーザ情報の編集に成功しました' }
      redirect_to "/"
    else
      render 'edit'
    end
  end
  
 
  private
  
  # パラムを制限(curlなどのツールからの不正なデータ送信を防御)
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :school, :birth_of_date, :gender)
  end
  
  def set_user 
    @user = User.find(params[:id])
  end
    
end

