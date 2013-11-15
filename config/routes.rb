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

  # resources
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
