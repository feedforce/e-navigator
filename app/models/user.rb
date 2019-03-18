class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: {maximum: 30}
  validates :school, length: {maximum: 50}
  enum sex: { woman: 0, man: 1 }

  has_many :interviews
end
