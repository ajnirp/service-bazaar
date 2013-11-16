Ser::Application.routes.draw do
  # static pages
  get "pages/contact"
  get "pages/home"
  match "/about", to: "pages#about", via: [:get]

  # home page
  root "pages#home", via: [:get, :post]

  # log in, sign up
  get "pages/login"
  get "pages/signup"
  match "/login", to: "pages#login", via: [:get]
  match "/signup", to: "pages#signup", via: [:get]
  match '/signout', :to => 'sessions#destroy', :via => 'delete'

  # resources
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :services

  # search and messages
  match "/search", to: "pages#search", via: [:get]
  match "/messages", to: "users#messages", via: [:get]
end
