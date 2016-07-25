Rails.application.routes.draw do
  get 'users/new'

  root "links#index"

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout
  resources :users, only: [:new, :create]
  resources :links, only: [:create, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
