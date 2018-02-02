class AddColumnUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birthdate, :integer
    add_column :users, :gender, :integer, default: 0
    add_column :users, :school_name, :string
  end
end
