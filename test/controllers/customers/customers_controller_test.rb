require 'test_helper'

class Customers::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_customers_show_url
    assert_response :success
  end

  test "should get quit" do
    get customers_customers_quit_url
    assert_response :success
  end

  test "should get out" do
    get customers_customers_out_url
    assert_response :success
  end

  test "should get edit" do
    get customers_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get customers_customers_update_url
    assert_response :success
  end

end
