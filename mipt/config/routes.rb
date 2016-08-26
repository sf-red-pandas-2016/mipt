Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :home, only: [:index, :dashboard]
  resources :dashboard

  # get 'courses/index'
  #
  # get 'teachers/index'

  resources :teachers
  resources :students
  resources :courses

  resources :courses do
    resources :students
  end

end
