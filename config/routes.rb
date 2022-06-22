Rails.application.routes.draw do
  resources :favorites
  resources :api_calls
  resources :scores
  resources :games
  resources :game_types
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
