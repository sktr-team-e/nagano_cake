require 'test_helper'

class Customers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customers_orders_new_url
    assert_response :success
  end

  test "should get log" do
    get customers_orders_log_url
    assert_response :success
  end

  test "should get create" do
    get customers_orders_create_url
    assert_response :success
  end

  test "should get thanx" do
    get customers_orders_thanx_url
    assert_response :success
  end

  test "should get index" do
    get customers_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_orders_show_url
    assert_response :success
  end

end
