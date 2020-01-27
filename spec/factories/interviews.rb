# frozen_string_literal: true

FactoryBot.define do
  factory :interview do
    schedule { '2020-01-27 19:16:51' }
    attendable { false }
    interviewer_id { 1 }
    interviewee_id { 1 }
  end
end
