# frozen_string_literal: true

Rails.application.routes.draw do
  get 'interviews/new'
  get 'interviews/index'
  get 'interviews/edit'
  devise_for :users,
             controllers: {
               registrations: 'users/registrations',
               sessions: 'users/sessions',
               passwords: 'users/passwords'
             }
  root 'pages#home'
  get 'pages/index'
  get 'pages/show'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
end
