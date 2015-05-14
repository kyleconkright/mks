Rails.application.routes.draw do

  root 'orders#new'

  resources :orders

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
