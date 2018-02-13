module InterviewsHelper

  def get_current_interview(user)
    Interview.find_by(user_id: user.id, status: 1)
  end

  def check_current_interview(interview)
    interview ? interview.interview_date.strftime("%Y年%m月%d日 %H時%M分") + "に面談が設定されています" : "現在面談は設定されていません"
  end
end
