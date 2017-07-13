class PagesController < ApplicationController

  def show
    @products = []
    current_user.orders.each do |order|
      order.carts.each do |item|
         @products.push(Product.find(item.product_id))
      end
    end
  end

end
