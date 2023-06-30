Rails.application.routes.draw do
  get 'articles/index'
  root to: 'home#top'
  devise_for :users
end
