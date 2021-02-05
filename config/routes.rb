Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  root 'sessions#home'
  
  get '/signup' => 'users#new'

  resources :users
  resources :items
  resources :types
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
