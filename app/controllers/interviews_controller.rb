class InterviewsController < ApplicationController
  def index
    @interviews = Interview.where(user_id: params[:user_id]).page(params[:page]).per(10)
  end

  def new
  end

  def create
  end
end
