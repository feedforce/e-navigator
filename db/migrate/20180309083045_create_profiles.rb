class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string  :email
      t.string  :name
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.string  :sex
      t.string  :school
      t.integer :user_id

      t.timestamps
    end
  end
end
