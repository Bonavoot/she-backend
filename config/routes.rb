Rails.application.routes.draw do

  resources :user_stocks
  resources :stocks, only: [:index, :show]
  resources :users

  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end