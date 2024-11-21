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
      format.html { redirect_to cart_path, notice: "Product added to cart." }
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('cart', partial: 'carts/cart', locals: { cart: @cart }),
          turbo_stream.replace(@product)
        ]
      end
    end
  end

  def remove_one
    orderable = Orderable.find_by(id: params[:id])
    
    if orderable.quantity > 1
      orderable.update(quantity: orderable.quantity - 1)
    else
      orderable.destroy
    end  
    
    respond_to do |format|
      format.html { redirect_to cart_path, notice: "One product removed from cart." }
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('cart', partial: 'carts/cart', locals: { cart: @cart }),
          turbo_stream.replace(@product)
        ]
      end
    end
  
  end 
  
  def remove
    orderable = Orderable.find_by(id: params[:id])

    if orderable
      orderable.destroy
    else
      flash[:alert] = "Item not found."
    end

    respond_to do |format|
      format.html { redirect_to cart_path, notice: "Product removed from cart." }
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart', partial: 'carts/cart', locals: { cart: @cart })
      end
    end
  end
end

