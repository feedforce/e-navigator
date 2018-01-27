class InterviewsController < ApplicationController

  def index
    @interviews = Interview.where(id: current_user.id)
  end

  def new
  end

  def create
  end
end
