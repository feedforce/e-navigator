# frozen_string_literal: true

FactoryBot.define do
  factory :interview do
    schedule { Time.now.tomorrow }
    schedule_status { 'pending' }
    association :user, :member
    interviewer_id { FactoryBot.create(:user, :interviewer).id }
  end
end
