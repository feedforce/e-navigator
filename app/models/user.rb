class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :interviews
  # 性別の設定
  enum gender: { male: 0, female: 1 }

  # 年齢の判別
  def age
    (Time.current.try(:strftime, "%Y%m%d").to_i - self.birthdate.try(:strftime, "%Y%m%d").to_i) / 10000
  end

end
