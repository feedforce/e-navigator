Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  [
      :users
  ].each do |sym|
    resources sym do

    end
  end
end
