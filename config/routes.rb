Rails.application.routes.draw do
  get '/' => 'home#top'

  get 'user/new' => 'user#new'
  post 'user/create' => 'user#create'
  post 'user/:id/edit' => 'user#edit'
  post 'user/:id/update' => 'user#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
