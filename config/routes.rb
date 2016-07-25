Rails.application.routes.draw do
  root "links#index"

  get "/login", to: "sessions#new", as: :login
end
