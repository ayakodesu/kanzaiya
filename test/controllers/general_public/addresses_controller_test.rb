require "test_helper"

class GeneralPublic::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get general_public_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get general_public_addresses_edit_url
    assert_response :success
  end
end
