# frozen_string_literal: true

class RemoveColmunsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :gender, :integer
    remove_column :users, :role, :integer
  end
end
