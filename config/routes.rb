Rails.application.routes.draw do
  get 'sessions/new'

    # You can have the root of your site routed with "root"
    # root 'welcome#index'
  root 'suggestions#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
