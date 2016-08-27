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

  patch '/courses/:course_id/students/:student_id/remove', to: 'courses#students_remove'
  #route after clicking 'add to course' change student's course_id
  patch '/courses/:course_id/students/:student_id', to: 'courses#students_update'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
