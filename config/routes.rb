Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords"
} 
  devise_scope :user do
    get 'users/:id/edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    get 'index', to: 'users/registrations#index', as: 'index'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
    root :to => "users/registrations#index"
  end
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
