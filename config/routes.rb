Rails.application.routes.draw do
  get '/departments', to: "departments#index"
  get '/department/:id', to: "departments#show"
  post '/department', to: "departments#create"
  put '/department/:id', to: "departments#update"
  delete '/department/:id', to: "departments#delete"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
