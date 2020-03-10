# frozen_string_literal: true

module ApplicationHelper
  def current_user?(user)
    user == current_user
  end
end
