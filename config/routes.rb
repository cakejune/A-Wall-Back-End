Rails.application.routes.draw do
  resources :friends
  # resources :friend_requests
  devise_for :users,
             path: "",
             path_names: {
               sign_in: "login",
               sign_out: "logout",
               registration: "signup",
             },
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
             }
#I may want to change all of these routes to instead of having the params[:id] in the url, have it in the controller action themselves and just have a before_action :authenticate user or something, but I have to figure out how authenticate works. Does it check a session hash? 
#Friend Requests
get "/:id/friend_requests", to: "friend_requests#my_friend_requests"
# patch "/friend_requests/:id", to: "friend_requests#update"
patch "/accept_friend", to: "friend_requests#accept_friend"
get "/friend_requests", to: "friend_requests#index"

#Friends
get "/friends", to: "friends#index"
get "/:id/friends", to: "friends#my_friends"

#Users
get "/jake", to: "users#jake"
get "/users/:id/alarms", to: "users#get_user_alarms"
get "/me", to: "users#show"

#Alarms
  get "/alarms/:id", to: "alarms#show"
  get "/alarms/:id/messages/:audio_id", to: "alarms#show_audio"
  delete "/alarms/:id/messages/:audio_id/delete",
         to: "alarms#purge_audio",
         as: "purge_attachment"
  get "/alarms", to: "alarms#index"
  post "/alarms", to: "alarms#create"
  patch "/alarms/:id", to: "alarms#update"
  patch "/alarms/:id/add_audio_message", to: "alarms#add_audio_message"
  
  
  
  
  # post "/login", to: "sessions#create"
  # delete "/logout", to: "sessions#destroy"
  # post "/signup", to: "users#create"
  get "/hello", to: "application#hello_world"
  match "*path", to: "application#options", via: :options

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
