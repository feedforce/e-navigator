class AddProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :sex, :string
    add_column :users, :belonging, :integer
    add_column :users, :meetingdate, :date
  end
end
