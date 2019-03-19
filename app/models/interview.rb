class Interview < ApplicationRecord
  belongs_to :user

  validates :start_datetime, presence: true
  enum status: { reservation: 0, rejection: 1, approval: 2 }
end
