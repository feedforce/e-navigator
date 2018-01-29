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
    (today.strftime(date_format).to_i - birthdate.strftime(date_format).to_i) / 10000
  end

  def approvaldate
    interview_status=interviews.where("interview_status = '承認'")
    if interview_status.count>0
      interview_status.limit(1).interview_date_format
    else
      nil
    end
  end
  
end
