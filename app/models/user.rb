class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  enum gender: { male: 0, female: 1 }
end
