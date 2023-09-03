require "application_system_test_case"

class Packs::Customers::CustomersTest < ApplicationSystemTestCase
  setup do
    @packs_customers_customer = packs_customers_customers(:one)
  end

  test "visiting the index" do
    visit packs_customers_customers_url
    assert_selector "h1", text: "Customers"
  end

  test "should create customer" do
    visit packs_customers_customers_url
    click_on "New customer"

    fill_in "Address", with: @packs_customers_customer.address
    fill_in "Email", with: @packs_customers_customer.email
    fill_in "Mobile", with: @packs_customers_customer.mobile
    fill_in "Name", with: @packs_customers_customer.name
    fill_in "Username", with: @packs_customers_customer.username
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "should update Customer" do
    visit packs_customers_customer_url(@packs_customers_customer)
    click_on "Edit this customer", match: :first

    fill_in "Address", with: @packs_customers_customer.address
    fill_in "Email", with: @packs_customers_customer.email
    fill_in "Mobile", with: @packs_customers_customer.mobile
    fill_in "Name", with: @packs_customers_customer.name
    fill_in "Username", with: @packs_customers_customer.username
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer" do
    visit packs_customers_customer_url(@packs_customers_customer)
    click_on "Destroy this customer", match: :first

    assert_text "Customer was successfully destroyed"
  end
end
