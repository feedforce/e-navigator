class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
      edit_user_path(current_user.id)
  end
  #日程調整機能実装作業開始時に削除
end
