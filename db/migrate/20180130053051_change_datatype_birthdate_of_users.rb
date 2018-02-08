class ChangeDatatypeBirthdateOfUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :birthdate, :integer
    add_column :users, :birth_date, :date
  end
end
