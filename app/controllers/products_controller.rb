class ProductsController < ApplicationController

  def index
    @products = Product.all.order(:name).page params[:page]
    if current_user
      @cart = current_order.carts.new
    end
  end

  def show
    @product = Product.find(params[:id])
    @purchased_with = Product.display_purchased_with(@product)

    if current_user
      @cart = current_order.carts.new
    end
  end
end
