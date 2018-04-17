class Interview < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validate :datetime_cannot_be_in_the_past
  enum status: {
    suspended: 0,
    approved: 1,
    declined: 2
  }
  def datetime_cannot_be_in_the_past
    if datetime.present? && datetime.past?
      errors.add(:datetime, "に過去の日時は選択できません。")
    end
  end
end
