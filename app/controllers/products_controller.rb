class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = current_order.carts.new
  end
end
