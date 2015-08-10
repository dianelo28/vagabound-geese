Rails.application.routes.draw do

 # Static homepage route via pages controller
 root to: 'pages#index'

 get '/signup', to: 'users#new', as: :signup

 resources :users, only: [:new, :create, :show]

end
