Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'products#index'
  resources :carts
  resources :products
  resource :cart, only: [:show]
end
