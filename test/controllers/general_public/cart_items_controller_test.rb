require "test_helper"

class GeneralPublic::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get general_public_cart_items_index_url
    assert_response :success
  end
end
