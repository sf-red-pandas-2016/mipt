Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :home, only: [:index, :dashboard]
  resources :dashboard

  # get 'courses/index'
  #
  # get 'teachers/index'

  resources :teachers do 
  	resources :courses, only: [:new, :create]
  end

  resources :teachers

  resources :students
  resources :courses, except: [:new, :create]

  resources :courses do
    resources :students
  end

end
