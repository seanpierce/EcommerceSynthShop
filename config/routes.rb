Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'products#index'
  resources :carts
  resources :products
  resource :cart, only: [:show]

  resources :charges

  post '/add_one/:id', to: "carts#add_one"
  post '/remove_one/:id', to: "carts#remove_one"

end
