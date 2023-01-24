Rails.application.routes.draw do
  get '/jake', to: "users#jake"
  get '/alarms/:id', to: "alarms#show"
  get '/alarms/:id/messages/:audio_id', to: "alarms#show_audio"
  delete '/alarms/:id/messages/:audio_id/delete', to: "alarms#purge_audio", as: "purge_attachment"
  get '/alarms', to: "alarms#index"
  post '/alarms', to: "alarms#create"
  patch '/alarms/:id', to: "alarms#update"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  post '/signup', to: "users#create"
  get '/me', to: "users#show"
  get '/hello', to: 'application#hello_world'
  patch '/alarms/:id/add_audio_message', to: "alarms#add_audio_message"
  match '*path', to: 'application#options', via: :options

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
