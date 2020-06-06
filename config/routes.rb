Rails.application.routes.draw do
  #FOR USERS

  resources :users
  post "users/login", to: "users#login"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
  get "/", to: "home#index"

  #FOR TODOS
  get "todos", to: "todos#index"
  get "todos/create", to: "todos#create"
  get "todos/:id", to: "todos#show"
  #using convention
  resources :todos
end
