class User < ApplicationRecord
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, on: :create
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
end
