Rails.application.routes.draw do

  root 'welcome#index'

  resources :orders

  resources :users, only: [:index, :show, :create, :update, :new]
  get '/signup' => "users#new"

# ======= Static Pages =======
  get 'welcome/about'
  get 'welcome/index'

# ======= Sessions ROUTES ======= 
  get '/login' => 'sessions#new'
  get '/auth/twitter/', to: 'sessions#create', as: :twitter
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/login' => 'sessions#create' 
  delete '/logout' => 'sessions#destroy'

end
