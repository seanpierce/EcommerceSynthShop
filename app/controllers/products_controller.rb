class ProductsController < ApplicationController
  def index
    @products = Product.all.page params[:page]

    if current_user
      @cart = current_order.carts.new
    end
  end
  def show
    @product = Product.find(params[:id])
    @purchased_with = []
    freq = @product.purchased_with.split(',').inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    purchased_with_ids = freq.sort_by { |key, value| value }.reverse[0..2]
    purchased_with_ids.each do |id|
      @purchased_with.push(Product.find(id[0]))
    end
    if current_user
      @cart = current_order.carts.new
    end
  end
end
