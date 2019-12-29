# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  get 'pages/show'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
end
