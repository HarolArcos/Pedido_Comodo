Rails.application.routes.draw do
  resources :rpedidos
  resources :ordens
  resources :catalogos
  resources :companies
  root "login#formulario_login"
  get "login", to: "login#formulario_login"
  post "login", to: "login#login"
  get "main", to: "usuario#menuprincipal"
  get "fil", to: "usuario#f"
  resources :usuarios
  resources :rventa
  resources :supervisors
  resources :vendedors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "vendedors/upload", to: "vendedors#upload"
  # Defines the root path route ("/")
  # root "articles#index"
end
