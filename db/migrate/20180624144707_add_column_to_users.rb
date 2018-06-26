class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :date
    add_column :users, :gender, :integer
    add_column :users, :school, :string
  end
end
