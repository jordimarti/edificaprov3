require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url, headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
    assert_response :success
  end
end
