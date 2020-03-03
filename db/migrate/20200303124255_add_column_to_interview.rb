# frozen_string_literal: true

class AddColumnToInterview < ActiveRecord::Migration[6.0]
  def change
    add_column :interviews, :is_fixed, :boolean, default: false
    add_timestamps :interviews, null: true
    long_ago = DateTime.new(2000, 1, 1)
    Interview.update_all(created_at: long_ago, updated_at: long_ago)
    change_column_null :interviews, :created_at, false
    change_column_null :interviews, :updated_at, false
  end
end
