Rails.application.routes.draw do

  root 'sessions#home'
  
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete '/logout' => 'sessions#delete'

  get '/purchases/popular' => 'purchases#popular'

  resources :users, only: [:new, :create, :show]
  resources :items, except: [:destroy, :edit]
  resources :purchases, except: [:index]

  resources :types, only: [:new, :create, :index] do
    resources :items, only: [:new, :create, :index]
  end

  resources :items do
    resources :purchases, only: [:new, :create, :edit]
  end

  get 'auth/:provider/callback' => 'sessions#omniauth'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
