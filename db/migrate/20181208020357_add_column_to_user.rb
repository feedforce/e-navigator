class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :sex, :integer
    add_column :users, :schoolname, :string
    add_column :users, :birthday, :date
  end
end
