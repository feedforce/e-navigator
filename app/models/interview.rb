# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :user
  validates :interviewer_id, presence: true
  validates :interviewee_id, presence: true
  validates :scheduled_at, presence: true
end
