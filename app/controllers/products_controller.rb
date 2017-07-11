class ProductsController < ApplicationController
  def index
    @products = Product.all
    if current_user
      @cart = current_order.carts.new
    end
  end
  def show
    @product = Product.find(params[:id])
    if current_user
      @cart = current_order.carts.new
    end
  end
end
