class Interview < ApplicationRecord
  belongs_to :user
  enum availability: { hold: 0, approval: 1, rejected: 2 }

  validates :schedule, presence: true
  validate :check_datetime

  def check_datetime
    errors.add(:schedule, "の日付を正しく記入して下さい。") if Time.current > self.schedule
  end
end
