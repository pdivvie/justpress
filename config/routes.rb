Rails.application.routes.draw do
  resources :articles
  root to: 'pages#news'
end
