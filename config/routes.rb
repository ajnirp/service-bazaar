Ser::Application.routes.draw do
  get "pages/contact"
  get "pages/home"

  root "pages#home", via: [:get, :post]

  match "/about", to: "pages/about", via: [:get]
end
