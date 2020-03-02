# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InterviewsController, type: :controller do
  describe 'GET #new' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in @user
        get :new, params: { user_id: @user.id }
        expect(response).to be_successful
      end
    end
  end
end
