Rails.application.routes.draw do
  resources :orders_products
  resources :products
  resource :cart, only: [:show]
end
