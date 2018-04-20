Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions",
  passwords: "users/passwords"
  }
  devise_scope :user do
    root "users/sessions#new"
  end
  resources :users, only: [:index, :show] do
    resources :interviews, except: [:show] do
      member do
        post 'approve'
      end
      collection do
        post 'select_approver'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
