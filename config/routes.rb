Rails.application.routes.draw do

  get 'profile' => 'pages#profile'
  post 'edit' => 'pages#edit'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'pages#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
