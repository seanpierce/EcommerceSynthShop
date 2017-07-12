class Cart < ApplicationRecord
  has_many :orders
  has_many :products

  # validates :quantity, :product_id, :presence => true
  def item_in_cart?(current_order)
    current_order.carts.each do |stored_item|
      if self.product_id === stored_item.product_id
        stored_item
      else
        false
      end
    end
  end
end
