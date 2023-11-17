Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  resources :posts do
    resources :comments, only: %i[new create]
    resources :likes, only: %i[new create]
    member do
      post 'like'
    end
  end
end
