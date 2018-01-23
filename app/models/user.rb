class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true,  length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password  # bcryptを使用
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true 
  
  enum gender: %i( man woman )
  
end
