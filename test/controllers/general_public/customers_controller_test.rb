require "test_helper"

class GeneralPublic::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get general_public_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get general_public_customers_edit_url
    assert_response :success
  end
end
