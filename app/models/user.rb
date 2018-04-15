class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :interviews
  # 性別の設定
  enum gender: { male: 0, female: 1 }

  # 年齢の判別
  def age
    date_format = "%Y%m%d"
    (Time.current.strftime(date_format).to_i - self.birthdate.strftime(date_format).to_i) / 10000
  end

end
