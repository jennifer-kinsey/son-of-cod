Rails.application.routes.draw do

  resources :products do
    resources :reviews, :except => [:show, :index]
  end

  # resources :users do
  #   resources :reviews
  # end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  
end
