# frozen_string_literal: true

class AddColumnToInterview < ActiveRecord::Migration[6.0]
  def change
    add_column :interviews, :user_id, :integer
    add_column :interviews, :interviewer_id, :integer
    add_column :interviews, :schedule, :datetime
    remove_column :users, :gender, :integer
  end
end
