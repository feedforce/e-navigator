# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180614134744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interviews", force: :cascade, comment: "面談日テーブル" do |t|
    t.bigint "user_id", default: 0, null: false, comment: "ユーザーID"
    t.datetime "start_date", comment: "面談開始日時"
    t.integer "status", default: 0, null: false, comment: "ステータス(0=>保留,1=>却下,2=>承認)"
    t.integer "mentor_id", comment: "メンターID"
    t.integer "deleted", default: 0, null: false, comment: "削除フラグ(0=>未削除,1=>削除)"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "users", force: :cascade, comment: "ユーザーテーブル" do |t|
    t.string "name", default: "", null: false, comment: "名前"
    t.date "birthday", null: false, comment: "生年月日"
    t.integer "sex", default: 0, null: false, comment: "性別"
    t.string "school", default: "", null: false, comment: "学校"
    t.string "email", default: "", null: false, comment: "メールアドレス"
    t.string "password_digest", comment: "パスワード"
    t.integer "deleted", default: 0, null: false, comment: "削除フラグ(0=>未削除,1=>削除)"
    t.datetime "deleted_at", comment: "削除日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interviews", "users"
end
