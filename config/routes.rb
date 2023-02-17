Rails.application.routes.draw do
  

  resources :user_stocks, only: [:index, :create, :destroy]
  resources :stocks, only: [:index, :show]
  resources :users
  resources :watchlist_records, only: [:index, :create, :destroy]

  post "/signup", to: "users#create"
  get "/me", to: "users#me"
  post "/login", to: "sessions#create" 
  delete "/logout", to: "sessions#destroy"

  post '/users/:id/watchlist_records', to: 'watchlist_records#create'

end