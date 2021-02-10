Rails.application.routes.draw do

  root 'sessions#home'
  
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete '/logout' => 'sessions#delete'

  resources :users
  resources :items, only: [:show, :edit, :update, :destroy]

  resources :types do
    resources :items, only: [:new, :create, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
