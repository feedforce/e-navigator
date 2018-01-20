class AddNameAndBirthAndGenderAndUnivName < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birth, :date
    add_column :users, :gender, :int
    add_column :users, :univ_name, :string
  end
end
