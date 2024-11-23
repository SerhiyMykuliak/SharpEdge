class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @orders = Order.where(email: current_user.email).order(created_at: :desc).page(params[:page]).per(2)
  end

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

      @cart.orderables.each do |cart_item|
        @order.order_items.create(
          product: cart_item.product,
          quantity: cart_item.quantity,
          price: cart_item.product.price
        )
      end

      OrderMailer.order_confirmation(@order).deliver_now
      @cart.orderables.destroy_all
      redirect_to root_path, notice: "New order created"
    else
      redirect_to root_path, notice: "Something went wrong"
    end 
  end
  
  def destroy
    @order = Order.find_by(id: params[:id])
    if @order
      @order.destroy
      redirect_to orders_path, notice: "Order was successfully canceled."
    else
      redirect_to orders_path, alert: "Order not found."
    end
  end
  

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :address, :total, :delivery_method, :payment_method, orderables_attributes: [:product_id, :quantity])
  end 
end
