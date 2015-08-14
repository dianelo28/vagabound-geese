Rails.application.routes.draw do

  get 'tags/destroy'

 # Static homepage route via pages controller
 root to: 'posts#index'

 get '/signup', to: 'users#new', as: :signup
 get '/profile', to: 'users#show', as: :profile

 get "/login", to: "sessions#new", as: :new_session
 get "/logout", to: "sessions#destroy", as: :logout
 post "/login", to: "sessions#create", as: :login
 
 get "tags/:tag", to: "posts#index", as: :tag

 # resources :sessions, only: [:create]

 resources :users
 resources :posts
 resources :cities
 resources :comments

end

#      Prefix Verb   URI Pattern                Controller#Action
#        root GET    /                          posts#index
#      signup GET    /signup(.:format)          users#new
#     profile GET    /profile(.:format)         users#show
# new_session GET    /login(.:format)           sessions#new
#      logout GET    /logout(.:format)          sessions#destroy
#       login POST   /login(.:format)           sessions#create
#       users GET    /users(.:format)           users#index
#             POST   /users(.:format)           users#create
#    new_user GET    /users/new(.:format)       users#new
#   edit_user GET    /users/:id/edit(.:format)  users#edit
#        user GET    /users/:id(.:format)       users#show
#             PATCH  /users/:id(.:format)       users#update
#             PUT    /users/:id(.:format)       users#update
#             DELETE /users/:id(.:format)       users#destroy
#       posts GET    /posts(.:format)           posts#index
#             POST   /posts(.:format)           posts#create
#    new_post GET    /posts/new(.:format)       posts#new
#   edit_post GET    /posts/:id/edit(.:format)  posts#edit
#        post GET    /posts/:id(.:format)       posts#show
#             PATCH  /posts/:id(.:format)       posts#update
#             PUT    /posts/:id(.:format)       posts#update
#             DELETE /posts/:id(.:format)       posts#destroy
#      cities GET    /cities(.:format)          cities#index
#             POST   /cities(.:format)          cities#create
#    new_city GET    /cities/new(.:format)      cities#new
#   edit_city GET    /cities/:id/edit(.:format) cities#edit
#        city GET    /cities/:id(.:format)      cities#show
#             PATCH  /cities/:id(.:format)      cities#update
#             PUT    /cities/:id(.:format)      cities#update
#             DELETE /cities/:id(.:format)      cities#destroy
# comments GET    /comments(.:format)          comments#index
#              POST   /comments(.:format)          comments#create
#  new_comment GET    /comments/new(.:format)      comments#new
# edit_comment GET    /comments/:id/edit(.:format) comments#edit
#      comment GET    /comments/:id(.:format)      comments#show
#              PATCH  /comments/:id(.:format)      comments#update
#              PUT    /comments/:id(.:format)      comments#update
#              DELETE /comments/:id(.:format)      comments#destroy
