class NotificationMailer < ApplicationMailer
  helper ApplicationHelper

  def notification_new_interview(interview)
    @interview = interview
    users = User.where.not(id: @interview.user_id)
    users.each do |user|
    mail(to: user.email, subject: "新規面接日時が登録されました")
    end
  end

  def notification_approved_interview(approver, interview)
    @interview = interview
    @approver = approver
    mail(to: @interview.user.email, cc: approver.email, subject: "面接日時が確定しました")
  end
end
