Rails.application.routes.draw do
  get 'home/top', to: 'home#top'
  root to: 'articles#index'
  devise_for :users
  get 'users/:user_id/avatar/edit', to: 'avatars#edit'
  put 'users/:user_id/avatar', to: 'avatars#update'
  delete 'users/:user_id/avatar', to: 'avatars#destroy'
  resources :users, only: [:show] do
    resources :articles do
      resources :paragraphs, only: [:new, :create, :edit, :update, :destroy] do
        resources :images, only: [:new, :create, :edit, :update, :destroy]
      end
    end
  end
end
