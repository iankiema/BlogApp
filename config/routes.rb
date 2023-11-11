Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
    member do
      post 'like'
    end
  end

  resources :posts, only: [:new, :create]
end
