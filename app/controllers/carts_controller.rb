class CartsController < ApplicationController
  def show
  end

  def add
    @product = Product.find_by(id: params[:id])

    if @product
      orderable = @cart.orderables.find_or_initialize_by(product_id: @product.id)
      orderable.increment!(:quantity)
      orderable.save
    else
      flash[:alert] = "Product not found."
    end

    respond_with_cart("Product added to cart.")
  end

  def remove_one
    orderable = Orderable.find_by(id: params[:id])

    if orderable
      orderable.quantity > 1 ? orderable.decrement!(:quantity) : orderable.destroy
    else
      flash[:alert] = "Item not found."
    end

    respond_with_cart("One product removed from cart.")
  end

  def remove
    orderable = Orderable.find_by(id: params[:id])

    if orderable
      orderable.destroy
    else
      flash[:alert] = "Item not found."
    end

    respond_with_cart("Product removed from cart.")
  end

  private

  def respond_with_cart(message)
    respond_to do |format|
      format.html { redirect_to cart_path, notice: message }
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('cart', partial: 'carts/cart', locals: { cart: @cart }),
          turbo_stream.replace('cart-toggle', partial: 'carts/cart_toggle', locals: { cart: @cart })
        ]
      end
    end
  end
end
