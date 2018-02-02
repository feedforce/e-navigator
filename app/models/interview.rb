class Interview < ApplicationRecord
  belongs_to :user
  enum status: { default: 0, approved: 1, declined: 2 }
end
