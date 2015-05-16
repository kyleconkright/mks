Rails.application.routes.draw do

  root 'orders#new'

  get '/auth/:provider/callback', to: 'sessions#create'
  
  resources :orders, only: [:create, :index, :new]

  resources :users, only: [:index, :show, :create, :update, :new]

  get '/signup' => "users#new"


  post '/getquote' => 'orders#get_quote'
  post '/confirm' => 'orders#create_remote_order'


# ======= Static Pages =======
  get 'welcome/about'
  get 'welcome/index'

# ======= Sessions ROUTES ======= 
  get '/login' => 'sessions#new'
  get '/auth/twitter/', to: 'sessions#create_twitter_session', as: :twitter
  get '/auth/:provider/callback', to: 'sessions#create_twitter_session'
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy'

end
