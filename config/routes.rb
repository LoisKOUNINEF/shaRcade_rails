Rails.application.routes.draw do

  # Routes for JWT over Devise
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get '/member-data', to: 'members#show'

  # Routes to manage our Users (players, editors or admins)
  get 'users/actions', to: 'users/actions#index', as: 'users_index'
  get 'users/actions/:id', to: 'users/actions#show', as: 'user_show'

  # Route dedicated to ShaRcade "killer feature": score transmitting & storing API
  post 'sharcade_api', to: 'sharcades#eat_score', as: 'sharcade_entry'

  # More generic routes for other objects' CRUDs
  resources :feedbacks
  resources :favorites
  resources :api_calls
  resources :scores
  resources :games
  resources :game_types

end
