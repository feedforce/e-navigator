class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name , presence: true
  validates :gender , presence: true
  validates :school , presence: true
  validates :birth , presence: true
  
end
