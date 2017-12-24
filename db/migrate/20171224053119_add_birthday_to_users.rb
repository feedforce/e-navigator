class AddBirthdayToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthday, :integer
  end
end
