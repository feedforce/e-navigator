class User < ApplicationRecord
  enum gender: { male: 0, female: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
