Rails.application.routes.draw do
  root "application#index"
  get "login", to: "application#login"
  post "users/login", to: "users#login"
  get "users/:id", to: "users#show"
  get "logout", to: "application#logout"
  delete "users/:id", to: "users#destroy"
  post "users", to: "users#create"
  post "lists", to: "lists#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
