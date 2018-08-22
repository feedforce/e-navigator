class UsersController < ApplicationController
  def index
    if user_signed_in?
      # topベージにリダイレクト
    else
      redirect_to new_user_session_path
    end
  end
end
