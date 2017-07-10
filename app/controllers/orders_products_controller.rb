class OrdersProductsController < ApplicationController
  def create
    @order = current_order
    @item = @order.orders_products.new(product_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def destroy
    @order = current_order
    product_to_delete = nil
    OrdersProduct.all.each do |item|
      if params[:id].to_i == item.product_id
        product_to_delete = item
      end
    end
    product_to_delete.destroy
    @order.save
    redirect_to cart_path
  end

private
  def product_params
    params.require(:orders_product).permit(:quantity, :product_id)
  end
end
