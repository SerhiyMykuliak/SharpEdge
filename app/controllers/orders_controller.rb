class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.orderables = @cart.orderables.map(&:dup)
  end

  def create
    @order = Order.new(order_params)
    @order.total = @cart.total

    if @order.payment_method == "Bank card"
      payment_intent = Stripe::PaymentIntent.create(
        amount: (@order.total * 100).to_i,
        currency: 'usd',
        payment_method_types: ['card']
      )
    end 

    if @order.save 
      OrderMailer.order_confirmation(@order).deliver_now
      @cart.orderables.destroy_all
      redirect_to root_path, notice: "New order created"
    else
      redirect_to root_path, notice: "Something went wrong"
    end 
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :address, :total, :delivery_method, :payment_method, orderables_attributes: [:product_id, :quantity])
  end 
end
