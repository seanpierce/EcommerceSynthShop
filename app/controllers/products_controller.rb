class ProductsController < ApplicationController

  def index
    @products = Product.all
    @orders_product = current_order.orders_products.new
  end

end
