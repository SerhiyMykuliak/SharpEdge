class OrderMailer < ApplicationMailer
  default from: "notifications@example.com"

  def order_confirmation(order)
    @order = order
    mail(to: @order.email, subject: 'Order')
  end 

end
