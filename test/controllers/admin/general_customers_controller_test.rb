require "test_helper"

class Admin::GeneralCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_general_customers_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_general_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_general_customers_show_url
    assert_response :success
  end
end
