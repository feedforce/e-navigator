class AddStateDefaultToInterviews < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :state, :integer, default: 0
  end
end
