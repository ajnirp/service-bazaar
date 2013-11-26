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

  # forms for creation
  match "/services/new", to: "services#new", via: [:post, :get]
  match "/listings/new", to: "listings#new", via: [:post]
  match "/appointments/new", to: "appointments#new", via: [:post]

  #messages
  match '/messages', :to => "users#messages", via: [:get]
  match "/new_message", to: "users#new_message", via: [:post,:get]
  match "/transit", to: "users#transit", via: [:post,:get]

  # resources
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :services
  resources :listings
  resources :categories
  resources :appointments

  # search and messages
  match "/search", to: "pages#search", via: [:get]
  match "/messages", to: "users#messages", via: [:get]

  # miscellaneous matches
  match "/users/:id/offered", to: "users#offered", via: [:get]
  match "/confirm-appointment", to:"appointments#confirm", via: [:post]
end
