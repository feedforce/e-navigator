module ApplicationHelper

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
