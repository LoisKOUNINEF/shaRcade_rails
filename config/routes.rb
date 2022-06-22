Rails.application.routes.draw do

  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/member-data', to: 'members#show'

  resources :feedbacks
  resources :favorites
  resources :api_calls
  resources :scores
  resources :games
  resources :game_types

end
