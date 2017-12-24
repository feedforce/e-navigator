class AddSchoolToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :school, :string
  end
end
