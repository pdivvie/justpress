Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :topics, only: [:show]
  root to: 'pages#news'
end
