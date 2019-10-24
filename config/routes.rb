Rails.application.routes.draw do
  root "static_page#welcome"
  resources :workouts
  resources :users do 
    resources :routines
  end

  get '/login', to: 'sessions#new'
  #get '/auth/google/callback', to: 'users#google_login'
  post '/login', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#fb_create'
  get '/search' => 'workouts#search', :as => 'search_workout'

end
