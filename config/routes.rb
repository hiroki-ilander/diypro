Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  root to: 'posts#index'
end
