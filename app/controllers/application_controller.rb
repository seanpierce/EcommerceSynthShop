class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      order = Order.find(session[:order_id])
      @item_count = order.carts.count
      order
    else
      Order.new
    end
  end
end
