# frozen_string_literal: true

class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews, &:timestamps
  end
end
