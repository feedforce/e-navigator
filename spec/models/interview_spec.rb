# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Interview, type: :model do
  let(:member) { FactoryBot.create(:user, :member) }
  let(:interviewer) { FactoryBot.create(:user, :interviewer) }

  it 'is valid with interviewer_id, schedule and schedule_status' do
    interview = member.interviews.build(interviewer_id: interviewer.id, schedule: Time.now.tomorrow)
    expect(interview.valid?).to be_truthy
  end

  it 'is invalid without interviewer_id' do
    interview = member.interviews.build(interviewer_id: nil, schedule: Time.now.tomorrow)
    interview.valid?
    expect(interview.errors.of_kind?(:interviewer_id, :blank)).to be_truthy
  end

  it 'is invalid without schedule' do
    interview = member.interviews.build(interviewer_id: interviewer.id, schedule: nil)
    interview.valid?
    expect(interview.errors.of_kind?(:schedule, :blank)).to be_truthy
  end

  it 'is invalid with schedule in the past' do
    interview = member.interviews.build(interviewer_id: interviewer.id, schedule: 1.minute.ago)
    interview.valid?
    expect(interview.errors.of_kind?(:schedule, :past_date)).to be_truthy
  end
end
