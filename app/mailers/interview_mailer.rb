class InterviewMailer < ApplicationMailer
  # defaultの設定
  default from: 'example@example.com'

  # フォームからのparams[:email]に送信
  def sendmail_confirm(user, send_user)
    @user = user
    mail to: send_user.email, subject: '面接希望日が決まりました'
  end

  # ログインユーザーと面接対象ユーザーに送信
  def approval_mail
  end
end
