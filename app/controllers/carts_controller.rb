class CartsController < ApplicationController
  def create
    @order = current_order
    @item = @order.carts.find_or_initialize_by(product_id: params['cart']['product_id'])
    if @item.quantity != nil
      @item.quantity += params['cart']['quantity'].to_i
      @item.save
    else
      @item.quantity = params['cart']['quantity']
      @item.product_id = params['cart']['product_id']
    end
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
    redirect_to cart_path(current_order)
  end

  def show
    @cart = current_order.carts.order(:created_at)
    products = []
    current_order.carts.each do |item|
      products.push([Product.find(item.product_id), item.quantity])
    end
    current_order.total_price = products.collect { |product_info| product_info[0].price * product_info[1].to_i }.sum
  end

  def add_one
    item = Cart.find(params['item'])
    item.quantity += 1
    item.save
    current_order.save
    redirect_to cart_path(item)
  end

  def remove_one
    item = Cart.find(params['item'])
    item.quantity -= 1
    item.save
    current_order.save
    redirect_to cart_path(item)
  end

  def reset_cart
    # this happens in ChargesController
    flash[:notice] = "Thanks for placing your order. It is now processing."
    order = current_order
    order.status = "processing"
    order.save
    current_order

    cart = Cart.find(params['cart'])
    cart.each do |item, i|
      cart.each do |item_to_add, n|
        if i != n
          item.purchased_with << "#{item_to_add.id},"
        end
      end
      item.save
    end
    redirect_to '/'
  end

private
  def product_params
    params.require(:cart).permit(:quantity, :product_id)
  end
end
