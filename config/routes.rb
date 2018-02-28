Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    get 'add', to: 'movies#add', on: :collection
  end
  # get 'tags/:tag', to: 'movies#index', as: :tag
  resources :genres, only: [:index]
  resources :countries, only: [:index]
  resources :users
  root to: 'movies#index'
end
