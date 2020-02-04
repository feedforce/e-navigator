# frozen_string_literal: true

class RenameIntervieweeIdToInterviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :interviews, :interviewee_id, :user_id
  end
end
