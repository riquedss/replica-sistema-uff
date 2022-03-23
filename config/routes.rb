Rails.application.routes.draw do
  get 'deptcoords/', to: 'department_coordinators#index'
  get 'deptcoords/:id', to: 'department_coordinators#show'
  post 'deptcoords/', to: 'department_coordinators#create'
  patch 'deptcoords/:id', to: 'department_coordinators#update'
  delete 'deptcoords/:id', to: 'department_coordinators#destroy'
  get 'coursecoords/', to: 'course_coordinators#index'
  get 'coursecoords/:id', to: 'course_coordinators#show'
  post 'coursecoords/', to: 'course_coordinators#create'
  patch 'coursecoords/:id', to: 'course_coordinators#update'
  delete 'coursecoords/:id', to: 'course_coordinators#destroy'
  post 'login/', to: 'auth#login'
  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show'
  post 'users/', to: 'users#create'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
