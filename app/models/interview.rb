class Interview < ApplicationRecord
  belongs_to :user
  enum status: { default: 0, approved: 1, declined: 2 }
  validate :datetime_avalable

  def datetime_avalable
    if start_time.present? && start_time < 1.days.from_now
      errors.add(:start_time, "は今日の日付よりも1日以上後の日付を入力してください")
    end
  end
end
