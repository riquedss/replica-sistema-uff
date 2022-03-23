Rails.application.routes.draw do
  get '/disciplines', to: 'discipline#index'
  get '/disciplines/:id', to: 'discipline#show'
  post '/disciplines', to: 'discipline#create'
  put '/disciplines/:id', to: 'discipline#update'
  delete '/disciplines/:id', to: 'discipline#destroy'

  get '/departments', to: 'departments#index'
  get '/departments/:id', to: 'departments#show'
  post '/departments', to: 'departments#create'
  put '/departments/:id', to: 'departments#update'
  delete '/departments/:id', to: 'departments#destroy'

  get '/college_classes', to: 'college_classes#index'
  get '/college_classes/:id', to: 'college_classes#show'
  post '/college_classes', to: 'college_classes#create'
  put '/college_classes/:id', to: 'college_classes#update'
  delete '/college_classes/:id', to: 'college_classes#destroy'

  get '/class_enrollments', to: 'class_enrollments#index'
  get '/class_enrollments/:id', to: 'class_enrollments#show'
  post '/class_enrollments', to: 'class_enrollments#create'
  delete '/class_enrollments/:id', to: 'class_enrollments#destroy'

  get '/lectures', to: 'lectures#index'
  get '/lectures/:id', to: 'lectures#show'
  post '/lectures', to: 'lectures#create'
  delete '/lectures/:id', to: 'lectures#destroy'

  get '/dependencies', to: 'dependencies#index'
  get '/dependencies/:id', to: 'dependencies#show'
  post '/dependencies', to: 'dependencies#create'
  delete '/dependencies/:id', to: 'dependencies#destroy'
  
end
