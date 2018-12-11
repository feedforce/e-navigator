Rails.application.routes.draw do

  get "/" => "users#index"
  get "login" => "users#login_form"
  post "login" => "users#login"

  get "new" => "users#new"
  post "users/create" => "users#create"
  get "users/edit" => "users#edit"
  get "users/:id/logout" => "users#logout"
  get "users/:id/profile" => "users#profile"
  post "users/:id/update" => "users#update"


end
