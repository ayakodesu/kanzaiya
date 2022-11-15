require "test_helper"

class GeneralPublic::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get general_public_orders_new_url
    assert_response :success
  end

  test "should get index" do
    get general_public_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get general_public_orders_show_url
    assert_response :success
  end
end
