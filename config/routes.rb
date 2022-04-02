Rails.application.routes.draw do
  resources :vendedors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "vendedors/upload", to: "vendedors#upload"
  # Defines the root path route ("/")
  # root "articles#index"
end
