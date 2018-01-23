class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birth_of_date
      t.string :school
      
      # OAuth認証 用のカラム
      t.string :provider
      t.string :uid
      t.string :nickname
      
      t.timestamps
    end
  end
end

