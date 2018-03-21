class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :birthday, :date
    add_column :users, :company, :string
    add_column :users, :gender, :string
  end
end
