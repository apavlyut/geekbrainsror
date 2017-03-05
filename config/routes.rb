Rails.application.routes.draw do
  resources :comments
  resources :tickets do
    member do
      get :close, :reject, :open
    end
  end
  resources :users
  resource :session
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  root to: 'welcome#home'
end
