Rails.application.routes.draw do
  get "/", to: "landing#index"

  namespace :user do
    resources :shopping, only: [:index]
  end
  
  resources :shopping, only: [:index]
  resources :about, only: [:index]
  resources :login, only: [:index, :new, :create], controller: "login"
end
