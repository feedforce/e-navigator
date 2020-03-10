# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 'password' }

    trait :member do
      role { 'member' }
    end

    trait :interviewer do
      role { 'interviewer' }
    end
  end
end
