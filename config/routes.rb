Rails.application.routes.draw do
  root to: "landing#index"
  resources :user
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  # get 'user_sessions/new'
  # get 'user_sessions/create'
  # get 'user_sessions/destroy'

  # get "/user/shopping", to: "user/shopping#index"
  # # namespace :user do
  # #   resources :shopping, only: [:index, :show]
  # # end
  # resources :shopping, only: [:index]
  # resources :about, only: [:index]
  # resources :login, only: [:index, :new, :create], controller: "login"
end
