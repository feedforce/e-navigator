# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    redirect_to login_path unless user_signed_in?
  end

  def index; end

  def show; end
end
