Rails.application.routes.draw do

  devise_for :users
  resources :users, only:[:index, :edit, :update]
  root to: 'users#index'

end
