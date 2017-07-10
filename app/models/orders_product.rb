class OrdersProduct < ApplicationRecord
  has_many :orders
  has_many :products

  # validates :quantity, :product_id, :presence => true
end
