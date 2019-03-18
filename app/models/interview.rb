class Interview < ApplicationRecord
  belongs_to :user

  validates :start_datetime, presense: true
  enum status: { rejection: false, approval: true }
end
