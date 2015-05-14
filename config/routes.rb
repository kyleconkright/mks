Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  
  root 'orders#new'


  resources :orders, only: [:create, :index, :new]

  post '/getquote' => 'orders#get_quote'

  resources :users, only: [:index, :show, :create, :update, :new]


# ======= Static Pages =======
  get 'welcome/about'
  get 'welcome/index'

# ======= Sessions ROUTES ======= 
  get '/login' => 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy'

end
