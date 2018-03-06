Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get 'pages/show'

  as :user do
    get 'devise/registrations#edit', :to => 'pages#show', :as => :user_root
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
