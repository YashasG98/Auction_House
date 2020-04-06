Rails.application.routes.draw do
  
  post  "products/create" => "products#create"
  get   "products/add" => "products#add"
  get   "products/shop" => "products#list"
  post  "products/:id/new_bid" => "products#new_bid"
  get   "products/claim" => "products#claim_list"
  post  "products/:id/claim" => "products#claim"
  get   "products/claimed" => "products#claimed"
  get   "products/owned" => "products#owned"

  post  "login" => "users#login"
  get   "signup" => "users#new"
  get   "login" => "users#login_form"
  post  "users/create" => "users#create"
  get   "users/dashboard" => "users#dashboard"
  get "/" => "home#top"
end