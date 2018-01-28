class Interview < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :interview_date, presence: true
  validates :interview_status, length: { maximum: 50 }

  def interview_date_format
    return self.interview_date.to_s(:published_on)
  end
end
