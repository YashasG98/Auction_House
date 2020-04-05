Rails.application.routes.draw do
  
  post  "login" => "users#login"
  get   "signup" => "users#new"
  get   "login" => "users#login_form"
  post  "users/create" => "users#create"
  get   "users/:id/dashboard" => "users#dashboard"

  get "/" => "home#top"
end