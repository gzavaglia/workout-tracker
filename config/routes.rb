Rails.application.routes.draw do
  root "static_page#welcome"
  resources :routines
  resources :workouts
  resources :users

  get '/login', to: 'sessions#new'
  get '/auth/google/callback', to: 'users#google_login'
  post '/login', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  get '/auth/google/callback', to: 'users#google_login'
end
