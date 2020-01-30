# frozen_string_literal: true

class AddColumnToInterview < ActiveRecord::Migration[6.0]
  def change
    add_column :interviews, :interviewer_id, :integer
    add_column :interviews, :interviewee_id, :integer
    add_column :interviews, :scheduled_at, :datetime
  end
end
