require "test_helper"

class CancellationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cancellation = cancellations(:one)
  end

  test "should get index" do
    get cancellations_url
    assert_response :success
  end

  test "should get new" do
    get new_cancellation_url
    assert_response :success
  end

  test "should create cancellation" do
    assert_difference("Cancellation.count") do
      post cancellations_url, params: { cancellation: { cancelled_at: @cancellation.cancelled_at, reason: @cancellation.reason } }
    end

    assert_redirected_to cancellation_url(Cancellation.last)
  end

  test "should show cancellation" do
    get cancellation_url(@cancellation)
    assert_response :success
  end

  test "should get edit" do
    get edit_cancellation_url(@cancellation)
    assert_response :success
  end

  test "should update cancellation" do
    patch cancellation_url(@cancellation), params: { cancellation: { cancelled_at: @cancellation.cancelled_at, reason: @cancellation.reason } }
    assert_redirected_to cancellation_url(@cancellation)
  end

  test "should destroy cancellation" do
    assert_difference("Cancellation.count", -1) do
      delete cancellation_url(@cancellation)
    end

    assert_redirected_to cancellations_url
  end
end
