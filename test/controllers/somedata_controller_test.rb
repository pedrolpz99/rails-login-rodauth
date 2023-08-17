require "test_helper"

class SomedataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get somedata_index_url
    assert_response :success
  end
end
