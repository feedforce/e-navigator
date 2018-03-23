class AddCulomnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer, null: false, default: 0
    add_column :users, :school, :string
  end
end
