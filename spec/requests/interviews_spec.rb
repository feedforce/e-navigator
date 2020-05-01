# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InterviewsController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:interviewer) { FactoryBot.create(:user, :interviewer) }
  let(:interview) { user.interviews.create(params) }
  let(:params) { { interviewer: interviewer, schedule: Time.now.tomorrow, schedule_status: 'pending' } }

  describe 'GET #new' do
    subject { get new_user_interview_path(user), params: { user_id: user.id }; response }

    context 'as an authenticated user' do
      before { sign_in user }
      it { is_expected.to have_http_status '200' }
    end

    context 'as an unauthorized' do
      it { is_expected.to have_http_status '302' }
    end
  end

  describe 'GET #index' do
    subject { get user_interviews_path(user); response }

    context 'as an authenticated user' do
      before { sign_in user }
      it { is_expected.to have_http_status '200' }
    end

    context 'as an unauthorized' do
      it { is_expected.to have_http_status '302' }
    end
  end

  describe 'DELETE #destroy' do
    subject { delete user_interview_path(user, interview); response }

    context 'as an authenticated user' do
      before { sign_in user }
      it { is_expected.to have_http_status '302' }

      it 'deletes an interview' do
        expect { subject }.to change(user.interviews, :count).by(0)
      end
    end

    context 'as an unauthorized' do
      it { is_expected.to have_http_status '302' }

      it 'does not delete an interview' do
        expect { subject }.to change(user.interviews, :count).by(1)
      end
    end
  end
end
