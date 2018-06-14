class Interview < ApplicationRecord
  belongs_to :user

  enum status: { withhold: 0, reject: 1, approval: 2 }
end
