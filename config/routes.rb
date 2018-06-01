Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  [
      :users
  ].each do |sym|
    resources sym do

    end
  end
end
