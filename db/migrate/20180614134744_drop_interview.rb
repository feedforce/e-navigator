class DropInterview < ActiveRecord::Migration[5.1]
  def change
    drop_table :interviews

    create_table :interviews, comment: "面談日テーブル" do |t|
      t.references :user, foreign_key: true, default: 0,   null: false, comment:"ユーザーID"
      t.datetime :start_date,                                           comment:"面談開始日時"
      t.integer :status,                     default: 0,   null: false, comment:"ステータス(0=>保留,1=>却下,2=>承認)"
      t.integer :mentor_id,                                             comment:"メンターID"
      t.integer  :deleted,                   default: 0,   null: false, comment:"削除フラグ(0=>未削除,1=>削除)"
      t.datetime :deleted_at,                                           comment:"削除日時"

      t.timestamps
    end
  end
end
