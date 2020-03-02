# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :user
  validates :interviewer_id, presence: true
  validates :schedule, presence: true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    errors.add(:schedule, 'は過去の日付を選択できません。') if schedule.past?
  end
end
