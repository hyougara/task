Rails.application.routes.draw do
  resources :categories
  root to: "homes#top"
  # get 'microposts/index'
  get "/micropost", to: 'microposts#new'
  get "/session",to: 'sessions#new'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :microposts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
