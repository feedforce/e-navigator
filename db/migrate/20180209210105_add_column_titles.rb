class AddColumnTitles < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birth_date, :string
  end
end
