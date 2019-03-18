Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:index, :edit, :update]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
