Rails.application.routes.draw do
  get '/periods', to: "periods#index"
  get '/period/:id', to: "periods#show"
  post '/period', to: "periods#create"
  put '/period/:id', to: "periods#update"
  delete '/period/:id', to: "periods#delete"

  get '/departments', to: "departments#index"
  get '/department/:id', to: "departments#show"
  post '/department', to: "departments#create"
  put '/department/:id', to: "departments#update"
  delete '/department/:id', to: "departments#delete"

  #LOGIN

  post 'login/', to: 'auth#login'

  #DIRECTOR

  get 'director/', to: 'director#index'
  post 'director/', to: 'director#create'
  patch 'director/', to: 'director#update'

  #STUDENTS

  get 'students/', to: 'students#index'
  get 'professors/:id', to: 'students#show'
  post 'students/', to: 'students#create'
  patch 'students/:id', to: 'students#update'
  delete 'students/:id', to: 'students#destroy'

  #PROFESSORS

  get 'professors/', to: 'professors#index'
  get 'professors/:id', to: 'professors#show'
  post 'professors/', to: 'professors#create'
  patch 'professors/:id', to: 'professors#update'
  delete 'professors/:id', to: 'professors#destroy'

  #DEPARTMENT COORDINATORS

  get 'deptcoords/', to: 'department_coordinators#index'
  get 'deptcoords/:id', to: 'department_coordinators#show'
  post 'deptcoords/', to: 'department_coordinators#create'
  patch 'deptcoords/:id', to: 'department_coordinators#update'
  delete 'deptcoords/:id', to: 'department_coordinators#destroy'

  #COURSE COORDINATORS

  get 'coursecoords/', to: 'course_coordinators#index'
  get 'coursecoords/:id', to: 'course_coordinators#show'
  post 'coursecoords/', to: 'course_coordinators#create'
  patch 'coursecoords/:id', to: 'course_coordinators#update'
  delete 'coursecoords/:id', to: 'course_coordinators#destroy'

  #USERS

  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show'
  post 'users/', to: 'users#create'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
