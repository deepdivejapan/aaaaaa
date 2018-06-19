Rails.application.routes.draw do
  resources :contacts
  get 'sessions/new'

  root to: 'blogs#top'
  resources :blogs do
  collection do 
  post :confirm  
    
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/inbox"
  end
  end
  end
end
