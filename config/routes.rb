Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'blogs#top'
  resources :blogs
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]

end
