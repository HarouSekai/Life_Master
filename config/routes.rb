Rails.application.routes.draw do
  get 'home/top', to: 'home#top'
  root to: 'articles#index'
  devise_for :users
  resources :articles, only: [:index, :new, :create]
end
