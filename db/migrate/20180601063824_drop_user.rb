class DropUser < ActiveRecord::Migration[5.1]
  def change
    drop_table :users

    create_table :users, comment: "ユーザーテーブル" do |t|
      t.string   :name,             default: "",  null: false, comment:"名前"
      t.date     :birthday,                       null: false, comment:"生年月日"
      t.integer  :sex,              default: 0,   null: false, comment:"性別"
      t.string   :school,           default: "",  null: false, comment:"学校"
      t.string   :email,            default: "",  null: false, comment:"メールアドレス"
      t.string   :password_digest,                             comment:"パスワード"
      t.integer  :deleted,          default: 0,   null: false, comment:"削除フラグ(0=>未削除,1=>削除)"
      t.datetime :deleted_at,                                  comment:"削除日時"

      t.timestamps
    end
  end
end
