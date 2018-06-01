class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, comment: "ユーザーテーブル" do |t|
      t.string :name,              comment:"名前"
      t.date :birthday,            comment:"生年月日"
      t.integer :sex,              comment:"性別"
      t.string :school,            comment:"学校"
      t.string :email,             comment:"メールアドレス"
      t.string :password_digest,   comment:"パスワード"

      t.timestamps
    end
  end
end
