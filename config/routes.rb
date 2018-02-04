Rails.application.routes.draw do
  resources :movies do
    get 'add', to: 'movies#add', on: :collection
  end
  # get 'tags/:tag', to: 'movies#index', as: :tag
  root to: 'movies#index'
end
