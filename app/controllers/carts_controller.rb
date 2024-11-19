class CartsController < ApplicationController
  
  def show 
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = 1
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    
    if current_orderable
      current_orderable.update(quantity: current_orderable.quantity + 1)
    elsif quantity > 0
      @cart.orderables.create(product: @product, quantity: quantity)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'carts/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
    end 

  end
  
  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  end
  
end
