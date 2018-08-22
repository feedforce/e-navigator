class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.integer :b_y
      t.integer :b_m
      t.integer :b_d
      t.integer :gender
      t.string :school_name

      t.timestamps
    end
  end
end
