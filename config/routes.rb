Rails.application.routes.draw do
  devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'
  }

  devise_scope :user do
    root :to => "users/sessions#new"
  end

  get 'pages/show'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end