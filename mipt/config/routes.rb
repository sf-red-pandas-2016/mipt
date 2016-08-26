Rails.application.routes.draw do

  root 'home#index'

  resources :dashboard, only: [:index]

  resources :teachers do 
  	resources :courses, only: [:new, :create]
  end

  resources :teachers

  resources :students

  resources :courses, except: [:new, :create]

  resources :courses do
    resources :students
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end