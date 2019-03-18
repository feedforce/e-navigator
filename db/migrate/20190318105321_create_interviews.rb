class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :start_datetime, null: false
      t.boolean :status, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
