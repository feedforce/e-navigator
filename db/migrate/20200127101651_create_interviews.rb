# frozen_string_literal: true

class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.datetime :schedule
      t.boolean :attendable
      t.integer :interviewer_id
      t.integer :interviewee_id

      t.timestamps
    end
  end
end
