class Interview < ApplicationRecord
  belongs_to :user
  validate :check_datetime

  def check_datetime
    errors[:base] << "日時は現在以降を設定してください。" if self.interview_date < Time.current
  end
end
