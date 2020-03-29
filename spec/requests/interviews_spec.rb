# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InterviewsController, type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #new' do
    context 'as an authenticated user' do
      it 'returns 200 response' do
        sign_in user
        get new_user_interview_path(user), params: { user_id: user.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'as an unauthorized' do
      it 'returns 302 response' do
        get new_user_interview_path(user), params: { user_id: user.id }
        expect(response).to have_http_status '302'
      end
    end
  end

  describe 'GET #index' do
    context 'as an authenticated user' do
      it 'returns 200 response' do
        sign_in user
        get user_interviews_path(user)
        expect(response).to have_http_status '200'
      end
    end

    context 'as an unauthorized' do
      it 'returns 302 response' do
        get user_interviews_path(user)
        expect(response).to have_http_status '302'
      end
    end
  end
end
