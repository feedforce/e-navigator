class Interview < ApplicationRecord
  belongs_to :user

  enum status: { withhold: 0, reject: 1, approval: 2 }

  validates :user_id, presence: true
  validates :start_date, presence: true
end
