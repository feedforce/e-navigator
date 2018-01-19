class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :string
    add_column :users, :sex, :string
    add_column :users, :school_name, :string
  end
end
