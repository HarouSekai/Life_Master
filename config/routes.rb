Rails.application.routes.draw do
  get 'home/top', to: 'home#top'
  root to: 'articles#index'
  devise_for :users
  resources :users, only: [] do
    resources :articles do
      resources :paragraphs, only: [:new, :create, :edit, :update]
    end
  end
end
