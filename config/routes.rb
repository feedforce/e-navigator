Rails.application.routes.draw do
  devise_for :users
  root to:  'schedule#index'
  resources :users, only: [:show, :edit, :update]
end
