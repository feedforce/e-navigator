# frozen_string_literal: true

FactoryBot.define do
  factory :interview do
    user { FactoryBot.create(:user, :member) }
    interviewer { FactoryBot.create(:user, :interviewer) }
    schedule { Time.now.tomorrow }
    schedule_status { 'pending' }
  end
end
