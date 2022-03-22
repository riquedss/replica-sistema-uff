Rails.application.routes.draw do
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
