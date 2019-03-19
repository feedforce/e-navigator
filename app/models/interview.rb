class Interview < ApplicationRecord
  belongs_to :user

  validates :start_datetime, presence: true
  validate :add_error_start_datetime
  enum status: { reservation: 0, rejection: 1, approval: 2 }

  def add_error_start_datetime
    if start_datetime.past?
      errors.add(:start_datetime, "は未来の時間を指定してください")
    end
  end
end
