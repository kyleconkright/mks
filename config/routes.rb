Rails.application.routes.draw do

  root 'orders#new'

  get '/auth/:provider/callback', to: 'sessions#create'
  
  resources :orders, only: [:create, :index, :new]

  resources :users, only: [:index, :show, :create, :update, :new]

  post '/getquote' => 'orders#get_quote'

# ======= Static Pages =======
  get 'welcome/about'
  get 'welcome/index'

# ======= Sessions ROUTES ======= 
  get '/login' => 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy'

end
