Rails.application.routes.draw do
  get 'users/new'

  root "links#index"

  get "/login", to: "sessions#new", as: :login
  delete "/logout", to: "sessions#destroy", as: :logout
  resources :users, only: [:new, :create]
end
