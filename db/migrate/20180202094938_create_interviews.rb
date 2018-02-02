class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :start_time
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
