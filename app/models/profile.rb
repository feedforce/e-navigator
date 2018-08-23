class Profile < ApplicationRecord
  belongs_to :user
  enum gender: { "未選択": 0, "男性": 1, "女性": 2}
end
