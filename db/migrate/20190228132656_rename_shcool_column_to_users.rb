class RenameShcoolColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :shcool, :school
  end
end
