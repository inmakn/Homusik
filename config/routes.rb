Rails.application.routes.draw do

  get '/' => 'welcome#index', as: 'root'

  #User Routes
  resources :users

  #Ratio Routes
  resources :ratios

  #Sessions Routes
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/error' => 'sessions#error'
  get '/wrong_user' => 'sessions#wrong_user'

end
