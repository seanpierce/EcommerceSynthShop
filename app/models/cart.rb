class Cart < ApplicationRecord
  has_many :orders
  has_many :products

  validates :quantity, :product_id, :order_id, :presence => true
end
