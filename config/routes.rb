Rails.application.routes.draw do
  get '/jake', to: "users#jake"
  get '/alarms/:id', to: "alarms#show"
  get '/alarms', to: "alarms#index"
  post '/alarms', to: "alarms#create"
  patch '/alarms/:id', to: "alarms#update"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  post '/signup', to: "users#create"
  get '/me', to: "users#show"
  get '/hello', to: 'application#hello_world'
  match '*path', to: 'application#options', via: :options

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
