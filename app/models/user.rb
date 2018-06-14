class User < ApplicationRecord
  has_many :interviews
  
  enum sex: { male: 0, female: 1}

  before_save { self.email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :school, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validate :check_email, on: :check_email

  def check_email
    if User.select(:id).where.not(id: self.id.to_i).where(email: self.email, deleted: 0).present? &&
        self.email.present?

      self.errors.add(:email,"はすでに利用されているため登録できません。")
    end
  end

  has_secure_password

  class << self
    def sex_male()  {name: "男性",id: "male"} ;end
    def sex_female()    {name: "女性",id: "female"} ;end
    def sex_choices
      [
          [sex_male[:name], sex_male[:id]],
          [sex_female[:name], sex_female[:id]],
      ]
    end
  end
end
