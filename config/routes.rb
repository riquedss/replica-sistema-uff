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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
