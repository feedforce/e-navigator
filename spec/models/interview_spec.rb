# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Interview, type: :model do
  it 'is valid with interviewer_id, schedule and schedule_status' do
    expect(FactoryBot.build(:interview)).to be_valid
  end

  it 'is invalid without interviewer_id' do
    interview = FactoryBot.build(:interview, interviewer_id: nil)
    interview.valid?
    expect(interview.errors[:interviewer_id]).to include(I18n.t('errors.messages.blank'))
  end

  it 'is invalid without schedule' do
    interview = FactoryBot.build(:interview, schedule: nil)
    interview.valid?
    expect(interview.errors[:schedule]).to include(I18n.t('errors.messages.blank'))
  end

  it 'is invalid with schedule in the past' do
    interview = FactoryBot.build(:interview, schedule: 1.minute.ago)
    interview.valid?
    expect(interview.errors[:schedule]).to include(I18n.t('errors.messages.past_date'))
  end
end
