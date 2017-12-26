class AddUserParamsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, default: 'no_name'
    add_column :users, :birthday, :date
    add_column :users, :sex, :integer, default: 0, null: false, limit: 1
    add_column :users, :school, :string
  end
end
