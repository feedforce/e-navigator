Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :interviews
  end
  root "users#index"
end
