Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  get '/search', to: 'search#search'

    resources :users do
      get :followings, on: :member
      get :followers, on: :member
    end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  # post 'follow/:id' => 'relationships#follow', as: 'follow'
  # post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :relationships, only: [:create, :destroy]

end
