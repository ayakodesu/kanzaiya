require "test_helper"

class GeneralPublic::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get general_public_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get general_public_homes_about_url
    assert_response :success
  end
end
