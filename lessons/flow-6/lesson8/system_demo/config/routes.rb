Rails.application.routes.draw do
  resources :posts do
    get :publish, on: :member
  end
  root to: 'welcome#home'
end
