Rails.application.routes.draw do
  get 'signup' => "users#create"
  get '/' => "home#top"
end