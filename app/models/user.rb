# frozen_string_literal: true

class User < ApplicationRecord
  has_many :interviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { female: 'female', male: 'male', other: 'other' }
  enum role: { member: 'member', interviewer: 'interviewer' }
end
