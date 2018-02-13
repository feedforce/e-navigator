Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :interviews do
      member do
        patch :setup
      end
    end
  end
  root "users#index"
end
