Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books
  #resources :profile_image, only: [:new, :create, :index, :show, :destroy, :update]

  resources :users
end
