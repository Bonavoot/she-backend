Rails.application.routes.draw do
  
  resources :watchlist_records
  resources :user_stocks
  resources :stocks, only: [:index, :show]
  resources :users
  resources :watchlist_records, only: [:index, :create, :destroy]

  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end