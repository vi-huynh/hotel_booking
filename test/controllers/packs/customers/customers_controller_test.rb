require "test_helper"

class Packs::Customers::CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @packs_customers_customer = packs_customers_customers(:one)
  end

  test "should get index" do
    get packs_customers_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_packs_customers_customer_url
    assert_response :success
  end

  test "should create packs_customers_customer" do
    assert_difference("Packs::Customers::Customer.count") do
      post packs_customers_customers_url, params: { packs_customers_customer: { address: @packs_customers_customer.address, email: @packs_customers_customer.email, mobile: @packs_customers_customer.mobile, name: @packs_customers_customer.name, username: @packs_customers_customer.username } }
    end

    assert_redirected_to packs_customers_customer_url(Packs::Customers::Customer.last)
  end

  test "should show packs_customers_customer" do
    get packs_customers_customer_url(@packs_customers_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_packs_customers_customer_url(@packs_customers_customer)
    assert_response :success
  end

  test "should update packs_customers_customer" do
    patch packs_customers_customer_url(@packs_customers_customer), params: { packs_customers_customer: { address: @packs_customers_customer.address, email: @packs_customers_customer.email, mobile: @packs_customers_customer.mobile, name: @packs_customers_customer.name, username: @packs_customers_customer.username } }
    assert_redirected_to packs_customers_customer_url(@packs_customers_customer)
  end

  test "should destroy packs_customers_customer" do
    assert_difference("Packs::Customers::Customer.count", -1) do
      delete packs_customers_customer_url(@packs_customers_customer)
    end

    assert_redirected_to packs_customers_customers_url
  end
end
