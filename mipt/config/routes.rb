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
end
