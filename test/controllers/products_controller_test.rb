require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { agreement_id: @product.agreement_id, agreement_number: @product.agreement_number, height: @product.height, humidity_max: @product.humidity_max, humidity_min: @product.humidity_min, length: @product.length, temperature_max: @product.temperature_max, temperature_min: @product.temperature_min, weight: @product.weight, width: @product.width }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { agreement_id: @product.agreement_id, agreement_number: @product.agreement_number, height: @product.height, humidity_max: @product.humidity_max, humidity_min: @product.humidity_min, length: @product.length, temperature_max: @product.temperature_max, temperature_min: @product.temperature_min, weight: @product.weight, width: @product.width }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
