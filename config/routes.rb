Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :orders_products
  resources :products
  resource :cart, only: [:show]
end
