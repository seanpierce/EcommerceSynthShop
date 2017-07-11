class CartsController < ApplicationController
  def create
    @order = current_order
    @item = @order.carts.new(product_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def destroy
    @order = current_order
    product_to_delete = nil
    Cart.all.each do |item|
      if params[:id].to_i == item.product_id
        product_to_delete = item
      end
    end
    product_to_delete.destroy
    @order.save
    redirect_to cart_path
  end

  def show
    @cart = current_order.carts
    products = []
    current_order.carts.each do |item|
      products.push([Product.find(item.product_id), item.quantity])
    end
    current_order.total_price = products.collect { |product_info| product_info[0].price * product_info[1].to_i }.sum
  end

private
  def product_params
    params.require(:cart).permit(:quantity, :product_id)
  end
end
