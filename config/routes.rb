Rails.application.routes.draw do
  root "static_page#welcome"
  resources :routines
  resources :workouts
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  post '/projects', to: 'projects#create'

end
