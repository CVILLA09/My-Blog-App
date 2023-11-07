Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  # Route to display all users
  get 'users', to: 'users#index'
  
  # Route to show a single user
  get 'users/:id', to: 'users#show', as: 'user'
  
  # Route to list all posts for a given user
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  
  # Route to show a single post
  get 'posts/:id', to: 'posts#show', as: 'post'
end
