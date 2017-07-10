class OrderProduct < ApplicationRecord
  validates :order_id, :product_id, :presence => true
end
