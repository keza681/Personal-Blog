Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create]
  end

  resources :posts do
    resources :comments, only: %i[create new]
    resources :likes, only: [:create]
  end
end
