Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  #日程調整機能実装作業開始時に修正
end
