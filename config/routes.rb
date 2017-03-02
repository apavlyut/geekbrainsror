Rails.application.routes.draw do
  resources :posts do
    member do
      get :pubish_to_facebook
    end
  end
  resources :categories
  root to: 'welcome#index'

  get 'inline(.format)', to: 'welcome#inline'

end
