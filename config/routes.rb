Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "landing#index"
  resources :shopping, only: [:index]
  resources :about, only: [:index]
  resources :login, only: [:index]
end
