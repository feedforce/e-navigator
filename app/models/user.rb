class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable,:validatable

  enum sex: { sex_not_known: 0, male: 1, female: 2 }

end
