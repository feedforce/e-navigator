# frozen_string_literal: true

class AddSchoolToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :school, :string
  end
end
