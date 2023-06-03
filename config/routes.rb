Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :plates, only: [:index, :show]
      resources :posts, only: [:index, :create]
      resources :posts, only: [:show] do
        resources :comments, only: [:create, :update, :destroy]
      end
    end
  end
end
