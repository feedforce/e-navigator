class ChangeColumnstatusToInterviews < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :interview_date, :datetime, null: false
    change_column :interviews, :user_id, :integer, null: false, foreign_key: true
    change_column :interviews, :status, :integer, null: false, default: 0
  end
end
