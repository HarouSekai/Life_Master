Rails.application.routes.draw do
  get 'home/top', to: 'home#top'
  root to: 'articles#index'
  devise_for :users
  resources :users, only: [] do
    resources :articles, only: [:index, :show, :new, :create, :edit, :update] do
      resources :paragraphs, only: [:new, :create]
    end
  end
end
