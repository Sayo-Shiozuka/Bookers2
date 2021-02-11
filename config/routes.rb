Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :profile_images, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:index, :show, :edit]
end
