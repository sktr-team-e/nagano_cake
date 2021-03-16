require 'test_helper'

class Customers::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get customers_products_top_url
    assert_response :success
  end

  test "should get about" do
    get customers_products_about_url
    assert_response :success
  end

  test "should get index" do
    get customers_products_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_products_show_url
    assert_response :success
  end

end
