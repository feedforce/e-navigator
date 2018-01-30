class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :interview_date
      t.string :interview_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
