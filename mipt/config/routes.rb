Rails.application.routes.draw do
  # get 'courses/index'
  #
  # get 'teachers/index'

  resources :teachers
  resources :students
  resources :courses

  resources :courses do
    resources :students
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
