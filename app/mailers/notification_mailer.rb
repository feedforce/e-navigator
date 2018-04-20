class NotificationMailer < ApplicationMailer
  helper ApplicationHelper

  def notification_new_interview(user, approver)
    @user = user
    mail(to: approver.email, subject: "新規面接日時が登録されました")
  end

  def notification_approved_interview(approver, interview)
    @interview = interview
    @approver = approver
    mail(to: interview.user.email, cc: approver.email, subject: "面接日時が確定しました")
  end
end
