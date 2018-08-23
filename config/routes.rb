Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }
  get 'profiles/:user_id/edit', to: 'profiles#edit', as: 'edit_profiles'
  patch 'profiles/:user_id/edit', to: 'profiles#edit'
end
