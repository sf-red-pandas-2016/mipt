Rails.application.routes.draw do

  root 'home#index'

  resources :dashboard, only: [:index]

  resources :students

  resources :teachers do
  	resources :courses, only: [:new, :create]
  end

  resources :courses, except: [:new, :create]

  #route to see all students and select 'add to course'
  get '/courses/:course_id/students/add', to: 'courses#students_add'

  #route to see all students currently enrolled in course
  get '/courses/:course_id/students', to: 'courses#students_show'

  #route after clicking 'add to course' change student's course_id
  patch '/courses/:course_id/students', to: 'courses#students_update'

end
