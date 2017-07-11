class ProductsController < ApplicationController
  def index
    @products = Product.all
    # @cart = current_order.carts.new
  end
  def show
    @product = Product.find(params[:id])
    @cart = current_order.carts.new
  end
end
