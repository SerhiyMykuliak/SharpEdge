require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { blade_length: @product.blade_length, blade_material: @product.blade_material, blade_thickness: @product.blade_thickness, brand: @product.brand, description: @product.description, handle_length: @product.handle_length, handle_material: @product.handle_material, knife_type: @product.knife_type, name: @product.name, price: @product.price, stock_quantity: @product.stock_quantity, weight: @product.weight } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { blade_length: @product.blade_length, blade_material: @product.blade_material, blade_thickness: @product.blade_thickness, brand: @product.brand, description: @product.description, handle_length: @product.handle_length, handle_material: @product.handle_material, knife_type: @product.knife_type, name: @product.name, price: @product.price, stock_quantity: @product.stock_quantity, weight: @product.weight } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
