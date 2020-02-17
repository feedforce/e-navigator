# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :user
  validates :interviewer_id, presence: true
  validates :schedule, presence: true
end
