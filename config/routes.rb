Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  get 'pages/index'
  get 'pages/show'

end
