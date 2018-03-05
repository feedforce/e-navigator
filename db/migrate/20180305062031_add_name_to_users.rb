class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :birthday, :date
    add_column :users, :sex, :integer
    add_column :users, :company, :string 
  end
end
