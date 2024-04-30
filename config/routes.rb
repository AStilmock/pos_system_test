Rails.application.routes.draw do
  get "/", to: "landing#index"

  get "/user/shopping", to: "user/shopping#index"
  # namespace :user do
  #   resources :shopping, only: [:index, :show]
  # end
  resources :user, only: [:index, :show, :new, :create]
  resources :shopping, only: [:index]
  resources :about, only: [:index]
  resources :login, only: [:index, :new, :create], controller: "login"
end
