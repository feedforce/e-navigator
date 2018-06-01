class User < ApplicationRecord
  enum sex: { male: 0, female: 1}

  before_save { self.email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :school, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                   uniqueness: { case_sensitive: false }
  has_secure_password

  class << self
    def permit_params
      super + [
          :password,
          :password_confirmation,
      ]
    end

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
