class Profile < ApplicationRecord

  enum sex:{male: '男性', female: '女性'}
  belongs_to :user

end
