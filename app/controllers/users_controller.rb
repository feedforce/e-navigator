class UsersController < ApplicationController 
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
  
 
  private
  
  # パラムを制限(curlなどのツールからの不正なデータ送信を防御)
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

