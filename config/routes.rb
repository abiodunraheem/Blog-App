Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  resources :users, :posts, only: [:index, :show]
  # root "articles#index"
  root 'users#index'
end
