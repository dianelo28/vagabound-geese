Rails.application.routes.draw do

 # Static homepage route via pages controller
 root to: 'pages#index'

 get '/signup', to: 'users#new', as: :signup
 get '/profile', to: 'users#show', as: :profile

 get "/login", to: "sessions#new", as: :new_session
 get "/logout", to: "sessions#destroy", as: :logout
 post "/login", to: "sessions#create", as: :login

 # resources :sessions, only: [:create]

 resources :users, only: [:new, :create, :show]

end
