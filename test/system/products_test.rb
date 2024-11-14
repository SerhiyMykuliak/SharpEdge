require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "Blade length", with: @product.blade_length
    fill_in "Blade material", with: @product.blade_material
    fill_in "Blade thickness", with: @product.blade_thickness
    fill_in "Brand", with: @product.brand
    fill_in "Description", with: @product.description
    fill_in "Handle length", with: @product.handle_length
    fill_in "Handle material", with: @product.handle_material
    fill_in "Knife type", with: @product.knife_type
    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    fill_in "Stock quantity", with: @product.stock_quantity
    fill_in "Weight", with: @product.weight
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "Blade length", with: @product.blade_length
    fill_in "Blade material", with: @product.blade_material
    fill_in "Blade thickness", with: @product.blade_thickness
    fill_in "Brand", with: @product.brand
    fill_in "Description", with: @product.description
    fill_in "Handle length", with: @product.handle_length
    fill_in "Handle material", with: @product.handle_material
    fill_in "Knife type", with: @product.knife_type
    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    fill_in "Stock quantity", with: @product.stock_quantity
    fill_in "Weight", with: @product.weight
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
