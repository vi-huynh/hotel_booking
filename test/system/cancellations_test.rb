require "application_system_test_case"

class CancellationsTest < ApplicationSystemTestCase
  setup do
    @cancellation = cancellations(:one)
  end

  test "visiting the index" do
    visit cancellations_url
    assert_selector "h1", text: "Cancellations"
  end

  test "should create cancellation" do
    visit cancellations_url
    click_on "New cancellation"

    fill_in "Cancelled at", with: @cancellation.cancelled_at
    fill_in "Reason", with: @cancellation.reason
    click_on "Create Cancellation"

    assert_text "Cancellation was successfully created"
    click_on "Back"
  end

  test "should update Cancellation" do
    visit cancellation_url(@cancellation)
    click_on "Edit this cancellation", match: :first

    fill_in "Cancelled at", with: @cancellation.cancelled_at
    fill_in "Reason", with: @cancellation.reason
    click_on "Update Cancellation"

    assert_text "Cancellation was successfully updated"
    click_on "Back"
  end

  test "should destroy Cancellation" do
    visit cancellation_url(@cancellation)
    click_on "Destroy this cancellation", match: :first

    assert_text "Cancellation was successfully destroyed"
  end
end
