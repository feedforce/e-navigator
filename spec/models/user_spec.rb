# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it 'has a valid factory' do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it 'is valid with email and password' do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it 'is invalid without email' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'is invalid without password' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end

    it 'is invalid without short password' do
      user = FactoryBot.build(:user, password: 'a' * 5)
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end
  end
end
