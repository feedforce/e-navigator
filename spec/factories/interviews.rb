# frozen_string_literal: true

FactoryBot.define do
  factory :interview do
    user_id { FactoryBot.create(:user, :member).id }
    interviewer_id { FactoryBot.create(:user, :interviewer).id }
    schedule { Time.now.tomorrow }
    schedule_status { 'pending' }
  end
end
