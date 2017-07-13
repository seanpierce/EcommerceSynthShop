class PagesController < ApplicationController

  before_action :authorize_user, only: [:show]


  def show
    current_order
    @products = []
    current_user.orders.each do |order|
      if order.status === "processing"
        order.carts.each do |item|
           @products.push(Product.find(item.product_id))
        end
      end
    end
  end

end
