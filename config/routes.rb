Rails.application.routes.draw do
  get 'posts/new'

  get 'posts/create'

  get 'posts/index'

  root to: "welcome#home"

  
  resources :users
  resources :posts

  get 'signup', to: "users#new", as: "signup"
  get 'login', to: "sessions#new", as: "login"
  post 'login', to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"

end
