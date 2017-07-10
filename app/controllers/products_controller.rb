class ProductsController < ApplicationController

  def index
    @products = Product.all
    @orders_products = current_order.orders_products.new
  end

end
