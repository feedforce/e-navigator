class User < ApplicationRecord
  
  enum gender: {
      female: 0,
      male: 1,
      unanswered: 2
  }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
