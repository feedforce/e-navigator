Rails.application.routes.draw do

  devise_for :users, only: [:sign_in, :sign_out, :session]
  as :user do
    get '/users/sign_up', to: 'devise/registrations#new', as: :new_user_registration
    post '/users', to: 'devise/registrations#create', as: :user_registration
  end
  resources :users, only:[:index, :edit, :update]
  root to: 'users#index'

end
