Rails.application.routes.draw do
  root to: 'blogs#top'
    resources :blogs do
  end
end
