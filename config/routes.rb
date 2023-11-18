# Rails.application.routes.draw do
#   devise_for :users
#   root 'users#index'
#   resources :users, only: %i[index show] do
#     resources :posts, only: %i[index new create show destroy]
#   end

#   resources :posts do
#     resources :comments, only: %i[new create destroy]
#     resources :likes, only: %i[new create destroy]
#     member do
#       post 'like'
#     end

#   end
# end

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :likes, only: %i[new create]
      resources :comments, only: %i[new create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: %i[index new create]
        end
      end
    end
  end
end
