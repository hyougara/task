Rails.application.routes.draw do
  root to: "homes#top"  
  get "/signup", to: "users#new"
  get "/session",to: 'sessions#new'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, :categories,:microposts
end
