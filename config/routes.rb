Rails.application.routes.draw do
  root "application#index"
  get "login", to: "application#login"
  post "users/login", to: "users#login"
  get "users/:id", to: "users#show"
  get "logout", to: "application#logout"
  delete "users/:id", to: "users#destroy"
  post "users", to: "users#create"
  post "lists", to: "lists#create"
  get "lists/:id", to: "lists#show"
  delete "lists/:id", to: "lists#destroy"
  post "items", to: "items#create"
  delete "items/:id", to: "items#destroy"
  get "items/:id/edit", to: "items#edit"
  put "items/:id", to: "items#update"
  get "lists/:id/edit", to: "lists#edit"
  put "lists/:id", to: "lists#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
