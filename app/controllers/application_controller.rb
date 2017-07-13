require 'dotenv/load'

class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :pending_order


  def current_order #TODO "Who Carted?"
    if session[:order_id]
      order = Order.find(session[:order_id])
      if order.status === "processing"
        new_order = current_user.orders.create
        session[:order_id] = new_order.id
        @item_count = new_order.carts.count
        new_order
      else
        @item_count = order.carts.count
        order
      end
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

  def authorize_user
    if !current_user
      flash[:alert] = "Please log in to access this page"
      redirect_back(fallback_location: products_path)
    end
  end
end
