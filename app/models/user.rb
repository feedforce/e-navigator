class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true,  length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password(validations: false) # varidation 無効化
  has_secure_password(validations: false) # bcryptをvaridation 無効化
  # 通常のログインの時、６文字以上のバリデーションを付与する
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, allow_nil: true, if: :password_required?
  
  enum gender: %i( man woman )
  
  
  def age
    return nil unless birth_of_date # 生年月日が空ならnilを返却
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birth_of_date.strftime(date_format).to_i) / 10000
  end
  
  def self.find_or_create_from_auth(auth)
    self.find_or_create_by(provider: auth[:provider], uid: auth[:uid]) do |user|
      user.name = auth[:info][:nickname]
      user.email = User.dummy_email(auth)
    end
  end
  
  def self.dummy_email(auth)
    # gravatorデフォルト画像を取得するため、ダミーEmailを付与する
    "#{auth.uid}-#{auth.provider}@example.com"
  end
  
  def password_required?
    provider.blank?
  end
  
end
