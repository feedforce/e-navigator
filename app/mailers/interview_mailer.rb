class InterviewMailer < ApplicationMailer
  default from: 'example@example.com'

  def sendmail_confirm(user, send_user)
    @user = user
    mail to: send_user.email, subject: '面接希望日が決まりました'
  end

  # ログインユーザーと面接対象ユーザーに送信
  def approval_mail(user, other_user, interview_time)
    @user = user
    @other_user = other_user
    @interview_time = interview_time
    mail to: [@user.email, @other_user.email], subject: '面接日時が確定しました'
  end
end
