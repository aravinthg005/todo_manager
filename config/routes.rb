Rails.application.routes.draw do
  get "todos", to: "todos#index" 
  post "todos/create", to: "todos#create"
  get "todos/:id", to: "todos#show"

  #using convention
  resources :todos
end
