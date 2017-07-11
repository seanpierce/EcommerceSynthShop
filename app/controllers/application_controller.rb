class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :pending_order


  def current_order
    if session[:order_id]
      order = Order.find(session[:order_id])
      @item_count = order.carts.count
      order
    else
      if pending_order.any?
        session[:order_id] = pending_order[0].id
        order = Order.find(session[:order_id])
        @item_count = order.carts.count
        order
      else
        order = current_user.orders.create
      end
    end
  end

  def pending_order
    current_user.orders.each do |order|
      if order.status === "pending"
        order
      end
    end
  end
end
