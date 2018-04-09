class Interview < ApplicationRecord
  belongs_to :user
  enum availability: { hold: 0, approval: 1, rejected: 2 }
end
