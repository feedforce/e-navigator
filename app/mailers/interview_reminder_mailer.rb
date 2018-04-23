class InterviewReminderMailer < ApplicationMailer
  helper ApplicationHelper
  
  # メソッド名を変更しました
  def new_interview(user, approver)
    @user = user
    mail(to: approver.email, subject: "新規面接日時が登録されました")
  end

  # メソッド名を変更しました
  def approved_interview(approver, interview)
    @interview = interview
    @approver = approver
    mail(to: interview.user.email, cc: approver.email, subject: "面接日時が確定しました")
  end
end
