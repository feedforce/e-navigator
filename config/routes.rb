Rails.application.routes.draw do

  devise_for :users
  resources :users, only:[:index, :edit, :update]
  root to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
