class CartsController < ApplicationController
  def show
    @orders_product = current_order.orders_products
    products = []
    current_order.orders_products.each do |item|
      products.push([Product.find(item.product_id), item.quantity])
    end
    @total = products.collect { |product_info| product_info[0].price * product_info[1].to_i }.sum
  end
end
