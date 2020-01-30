# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :interviewer, class_name: 'User'
end
