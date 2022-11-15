require "test_helper"

class GeneralPublic::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get general_public_favorites_index_url
    assert_response :success
  end
end
