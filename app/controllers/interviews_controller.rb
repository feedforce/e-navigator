class InterviewsController < ApplicationController
  def index
    @interviews = current_user.interviews.all
  end
end
