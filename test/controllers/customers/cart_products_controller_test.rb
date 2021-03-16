require 'test_helper'

class Customers::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_cart_products_index_url
    assert_response :success
  end

  test "should get update" do
    get customers_cart_products_update_url
    assert_response :success
  end

  test "should get create" do
    get customers_cart_products_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_cart_products_destroy_url
    assert_response :success
  end

  test "should get all_destroy" do
    get customers_cart_products_all_destroy_url
    assert_response :success
  end

end
