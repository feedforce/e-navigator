# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :user
  validates :interviewer_id, presence: true
  validates :schedule, presence: true
  validates :schedule_status, presence: true
  validate :date_cannot_be_in_the_past

  enum schedule_status: { pending: 'pending', fixed: 'fixed' }

  def date_cannot_be_in_the_past
    errors.add(:schedule, I18n.t('errors.messages.past_date')) if schedule.present? && schedule.past?
  end
end
