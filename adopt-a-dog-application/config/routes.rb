Rails.application.routes.draw do
  root 'application#home'
  resources :adoptions, only: [:create, :index, :show] do
    resources :comments
  end
  resources :users
  resources :shelters
  resources :shelters, only: [:show] do
    resources :dogs, only: [:show, :index]
  end
  resources :owners do
    resources :adoptions, only: [:show]
  end
  resources :dogs
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  match '/auth/github/callback' => 'github_sessions#create', :via => [:get, :post]
  get '/auth/failure' => redirect('/')
  get '/signout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
