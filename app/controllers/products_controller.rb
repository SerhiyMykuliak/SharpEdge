class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :check_admin_role, only: [:new, :edit, :update, :create, :destroy]


  def index
    # Якщо params[:q] не існує, ініціалізуємо порожній хеш для пошуку
    @q = Product.ransack(params[:q])
  
    # Перевірка на наявність параметра order в params[:q]
    if params[:q] && params[:q][:order].present?
      @products = @q.result.order(params[:q][:order]).page(params[:page]).per(12)
    else
      @products = @q.result.page(params[:page]).per(12)
    end
  end  
  
  def show
    @reviews = @product.reviews.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy!
    redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." 
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock_quantity, :blade_material, :blade_length, :blade_thickness, :handle_material, :handle_length, :weight, :knife_type, :brand, :image, :content)
    end
end
