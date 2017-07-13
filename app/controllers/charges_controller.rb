class ChargesController < ApplicationController

  def new
  end

  def create
    # Add items to purchased_with, for "people who bought this also bought:"
    Order.add_to_puchased_with(current_order)

    # Amount in cents
    @amount = (current_order.total_price * 100).to_i
    order = current_order
    order.status = "processing"
    order.save
    current_order


    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    flash[:notice] = "Thanks! You paid $#{(@amount / 100).round(2)}."
    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to root_path
  end

end
