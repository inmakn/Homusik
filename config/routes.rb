Rails.application.routes.draw do

  get '/' => 'welcome#index', as: 'root'

  #User Routes, Ratio Routes
  resources :users, :ratios

  #Sessions Routes
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/error' => 'sessions#error'

end