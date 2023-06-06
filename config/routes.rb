Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :user_plates, only: [:create, :destroy]
      resources :users, only: [:index, :show, :create]
      resources :plates, only: [:index, :show]
      resources :posts, only: [:index, :create]
      resources :posts, only: [:show] do
        resources :comments, only: [:create, :update, :destroy]
      end
      resources :search, only: [:index]
      get "/search/hot_plates", to: "search#hot_plates"
    end
  end
end
