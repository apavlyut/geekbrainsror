Rails.application.routes.draw do
  get '/' =>'hamster#index'
  post '/' => 'hamster#change_hamster_number'
  # For details on the  DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
