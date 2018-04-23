class InterviewMailer < ApplicationMailer
  helper ApplicationHelper

  # メソッド名を変更しました
  def apply(user, approver)
    @user = user
    mail(to: approver.email, subject: "新規面接日時が登録されました")
  end

  # メソッド名を変更しました
  def approve(approver, interview)
    @interview = interview
    @approver = approver
    mail(to: interview.user.email, cc: approver.email, subject: "面接日時が確定しました")
  end
end
