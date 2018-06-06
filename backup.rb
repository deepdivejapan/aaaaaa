Rails.application.routes.draw do
  root to: 'blogs#top'
    resources :blogs do
    resources :users, only: [:new, :create, :show] do
    end  
    end
end
