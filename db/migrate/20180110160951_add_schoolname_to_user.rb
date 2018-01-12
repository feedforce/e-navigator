class AddSchoolnameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :schoolname, :string
  end
end
