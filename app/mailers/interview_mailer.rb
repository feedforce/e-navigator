class InterviewMailer < ApplicationMailer
  # defaultの設定
  default from: 'example@example.com'

  # フォームからのparams[:email]に送信
  def sendmail_confirm
  end

  # ログインユーザーと面接対象ユーザーに送信
  def approval_mail
  end
end
