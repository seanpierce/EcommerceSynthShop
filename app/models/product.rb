class Product < ApplicationRecord
  has_many :orders_products
  # validates :price, :name, :description, :presence => true
end
