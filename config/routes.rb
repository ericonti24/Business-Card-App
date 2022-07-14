Rails.application.routes.draw do
 
  get '/' => redirect('/business_cards')
  get '/business_cards', :to => 'business_cards#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/auth/:provider/callback' => 'sessions#create'

  resources :business_cards 
  resources :categories do 
    resources :business_cards, only: [:show]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
