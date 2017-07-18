Rails.application.routes.draw do
  get 'comments/create'

  resources :books

  resources :comments
  
  root to: 'welcome#home'
end
