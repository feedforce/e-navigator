Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#root' 
  resources :users
  
  get '/user/sign_up', to: 'toppages#root', as: "signup"
  get '/user/login', to: 'sessions#new' , as: "login"
  
  
end
