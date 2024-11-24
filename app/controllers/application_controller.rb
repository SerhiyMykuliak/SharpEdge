class ApplicationController < ActionController::Base
  before_action :set_render_cart
  before_action :initialize_cart

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart

    if current_user
      @cart ||= Cart.find_by(user_id: current_user.id)

      if @cart.nil?
        @cart = Cart.create(user_id: current_user.id)
      end
    else
      @cart ||= Cart.find_by(id: session[:cart_id])
      
      if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
  end

  def check_admin_role
    unless current_user.present? && current_user.role == "admin"
      redirect_to root_path, alert: "You do not have access to this page."
    end 
  end

end