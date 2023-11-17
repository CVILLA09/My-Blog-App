Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # Change to point to 'home#index'
  root "home#index"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      member do
        post 'like'
      end
    end
  end
end
