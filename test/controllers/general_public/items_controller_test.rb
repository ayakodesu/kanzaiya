require "test_helper"

class GeneralPublic::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get general_public_items_index_url
    assert_response :success
  end

  test "should get show" do
    get general_public_items_show_url
    assert_response :success
  end
end
