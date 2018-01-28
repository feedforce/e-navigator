class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum sex: { male: 1, famale: 2 , other: 3 }

  has_many :interviews

  def age
    date_format = "%Y%m%d"
    today = Date.today
    birthdate = self.birthdate
    return (today.strftime(date_format).to_i - birthdate.strftime(date_format).to_i) / 10000
  end
  
end
