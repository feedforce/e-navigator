class ChangeStatusToInterviews < ActiveRecord::Migration[5.1]
  def up
    remove_column :interviews, :status, :boolean
    add_column :interviews, :status, :integer, default: 0
  end
  def down
    remove_column :interviews, :status, :integer
    add_column :interviews, :status, :boolean, defalut: false
  end
end
