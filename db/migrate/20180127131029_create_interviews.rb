class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.references :user, foreign_key: true
      t.datetime   :interview_datetime, null: false
      t.integer    :state, null: false
      t.timestamps
    end
  end
end
