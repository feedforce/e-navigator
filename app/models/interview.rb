class Interview < ApplicationRecord

  enum status: { default: 0, approved: 1, declined: 2 }
end
