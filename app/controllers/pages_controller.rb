class PagesController < ApplicationController

  def home
    @products = Product.order(created_at: :desc).limit(3)
  end 

end
