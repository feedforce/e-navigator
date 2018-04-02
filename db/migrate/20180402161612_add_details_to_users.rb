class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birthdate, :datetime
    add_column :users, :gender, :integer, default: 0, null: false, limit: 1
    add_column :users, :school, :string
  end
end
