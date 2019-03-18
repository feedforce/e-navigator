class AddColumnUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birth_date, :date
    add_column :users, :sex, :integer
    add_column :users, :school, :string
  end
end
