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
    resources :students, controller: 'courses/students'
  end

end
