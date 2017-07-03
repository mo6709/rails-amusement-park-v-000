Rails.application.routes.draw do
  #root	
  root to:  'welcome#home'

  #sessions
  get 'signin' => 'sessions#new'
  post 'sessions/create' => 'sessions#create' 
  delete 'sessions/destroy' => 'sessions#destroy', :as => 'logout'

  #attractions
  resources :attractions

  #users
  resources :users

  #rides 
  post 'rides/new' => 'rides/new'
end