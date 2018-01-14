Rails.application.routes.draw do
  get 'top/index'

  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions"
  }

  root 'top#index'
end
