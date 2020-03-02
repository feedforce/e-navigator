# frozen_string_literal: true

class CreateInterview < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.integer :user_id
      t.integer :interviewer_id
      t.datetime :schedule
    end
  end
end
