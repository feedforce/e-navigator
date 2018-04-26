class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :schedule
      t.integer :availability, default: 0, null: false, limit: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
