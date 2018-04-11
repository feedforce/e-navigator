class Interview < ApplicationRecord
  belongs_to :user
  enum availability: { hold: 0, approval: 1, rejected: 2 }

  validates :schedule, presence: true
  validate :check_datetime

  def check_datetime
    errors.add(:schedule, "は現在よりも未来の時間を指定してください") if Time.current > self.schedule
  end
end
