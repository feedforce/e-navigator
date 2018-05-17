Rails.application.routes.draw do


  get 'users/form' => "users#form"
  get 'users/user_register' => "users#user_register"
  get 'users/:id/usertable' => "users#usertable"
  get 'users/:id/profile' => "users#profile"
  post 'users/user_register' => "users#user_register"
  post 'users/login' => 'users#login'
  post "users/regist" => "users#regist"
  post 'users/:id/profile' =>"users#profile_register"
  post "logout" => "users#logout"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
