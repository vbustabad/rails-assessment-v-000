Rails.application.routes.draw do
  root 'application#home'
  resources :adoptions, only: [:create, :index, :show] do
    resources :comments, only: [:show, :index, :new, :edit]
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
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/callback' => 'github_sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
