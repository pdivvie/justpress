Rails.application.routes.draw do
  resources :articles
  resources :topics, only: [:show]
  root to: 'pages#news'
end
