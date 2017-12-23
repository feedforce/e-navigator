class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :birth
      t.integer :sex
      t.string :school_name

      t.timestamps
    end
  end
end
