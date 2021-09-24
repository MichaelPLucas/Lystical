Rails.application.routes.draw do
  root "application#index"
  get "login", to: "application#login"
  post "users/login", to: "users#login"
  resources :comments
  resources :items
  resources :lists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
