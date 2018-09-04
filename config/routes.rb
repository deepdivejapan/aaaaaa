Rails.application.routes.draw do
  
  # get 'managers/index'

  # get 'managers/show'
  
  
  devise_for :managers
  as :manager do
    get 'managers/edit', to: 'devise/registrations#edit', :as => 'edit_manager_registration'
    put 'managers', to: 'devise/registrations#update', :as => 'manager_registration'
  end
  
  devise_scope :managers do
    post  "sessions/manager", to: 'devise/sessions#create'
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :contacts do
    collection do
      post :confirm
    end  
  end  
  
  root to: 'events#index'
  resources :events do
    collection do 
      post :confirm
    end
  end
    
    resources :feeds
    resources :user_sessions, only: [:new, :create, :destroy]
    resources :users
    resources :managers do 
       collection do 
         post :allow
         post :back
       end
    end  
    
    resource :about
    
    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/inbox"
    end
end
