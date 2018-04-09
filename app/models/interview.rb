class Interview < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :datetime, presence: true
  enum status: {
    suspended: 0,
    approved: 1,
    declined: 2
  }
end
