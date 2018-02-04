class Interview < ApplicationRecord
  belongs_to :user
  validate :check_datetime

  enum status: { hold: 0, accepted: 1, rejected: 2 }

  def check_datetime
    errors[:base] << "日時は現在以降を設定してください。" if self.interview_date.past?
  end
end
