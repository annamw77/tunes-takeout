Rails.application.routes.draw do

  root 'suggestions#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
  get '/auth/spotify/callback' => 'sessions#create'
  post 'favorite' => 'suggestions#favorite'
  delete 'unfavorite' => 'suggestions#unfavorite'
  get 'favorites' => 'suggestions#favorites'
end
