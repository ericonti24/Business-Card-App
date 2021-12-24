Rails.application.routes.draw do
 
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/auth/:provider/callback' => 'sessions#create'

  # post '/delete_business_card/:id' => 'business_cards#delete_business_card'

  # get '/business_cards_new' => 'business_cards#new'
  # post '/business_cards' => 'business_cards#create'
  # get '/business_card' => 'business_cards#show'

  resources :business_cards
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
