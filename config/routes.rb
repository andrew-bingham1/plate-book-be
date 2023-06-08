Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/userplate', to: 'user_plates#show'
       match '/userplate', to: 'user_plates#options', via: :options
      
      resources :locations, only: [:index]
        match '/locations', to: 'locations#options', via: :options

      resources :user_plates, only: [:create, :destroy]
        match '/user_plates', to: 'user_plates#options', via: :options
        match '/user_plates/:id', to: 'user_plates#options', via: :options

      resources :users, only: [:index, :show, :create, :update]
        match '/users', to: 'users#options', via: :options
        match '/users/:id', to: 'users#options', via: :options

      resources :plates, only: [:index, :show]
        match '/plates', to: 'plates#options', via: :options
        match '/plates/:id', to: 'plates#options', via: :options

      resources :posts, only: [:index, :create]
        match '/posts', to: 'posts#options', via: :options
        match '/posts/:id', to: 'posts#options', via: :options

      resources :posts, only: [:show] do
        resources :comments, only: [:create, :update]
          match '/comments', to: 'comments#options', via: :options
          match '/comments/:id', to: 'comments#options', via: :options
      end

      resources :search, only: [:index]
        match '/search', to: 'search#options', via: :options
      
      get "/search/hot_plates", to: "search#hot_plates"
        match '/search/hot_plates', to: 'search#hot_plates_options', via: :options
    end
  end
end