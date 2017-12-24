class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum sex: { man: 1, woman: 2 }
  
  validate :birthday_cannot_be_in_the_future

  def birthday_cannot_be_in_the_future
    if birthday.present? && birthday > Date.today
      errors.add(:birthday, "can not specify your future date as your birth date.")
    end
  end

end
