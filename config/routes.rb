Rails.application.routes.draw do
  root to: "homes#index" 
  get "/signup", to: "users#new"
  get "/session",to: 'sessions#new'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, :categories
  resources :microposts# , only: [:create, :destroy]
end
