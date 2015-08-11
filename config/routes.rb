Rails.application.routes.draw do

 # Static homepage route via pages controller
 root to: 'posts#index'

 get '/signup', to: 'users#new', as: :signup
 get '/profile', to: 'users#show', as: :profile

 get "/login", to: "sessions#new", as: :new_session
 get "/logout", to: "sessions#destroy", as: :logout
 post "/login", to: "sessions#create", as: :login

 # resources :sessions, only: [:create]

 resources :users
 resources :posts

end

# Prefix Verb   URI Pattern               Controller#Action
#       root GET    /                         pages#index
#     signup GET    /signup(.:format)         users#new
#    profile GET    /profile(.:format)        users#show
# new_session GET    /login(.:format)          sessions#new
#     logout GET    /logout(.:format)         sessions#destroy
#      login POST   /login(.:format)          sessions#create
#      users GET    /users(.:format)          users#index
#            POST   /users(.:format)          users#create
#   new_user GET    /users/new(.:format)      users#new
#  edit_user GET    /users/:id/edit(.:format) users#edit
#       user GET    /users/:id(.:format)      users#show
#            PATCH  /users/:id(.:format)      users#update
#            PUT    /users/:id(.:format)      users#update
#            DELETE /users/:id(.:format)      users#destroy
#      posts GET    /posts(.:format)          posts#index
#            POST   /posts(.:format)          posts#create
#   new_post GET    /posts/new(.:format)      posts#new
#  edit_post GET    /posts/:id/edit(.:format) posts#edit
#       post GET    /posts/:id(.:format)      posts#show
#            PATCH  /posts/:id(.:format)      posts#update
#            PUT    /posts/:id(.:format)      posts#update
#           #  DELETE /posts/:id(.:format)      posts#destroy
