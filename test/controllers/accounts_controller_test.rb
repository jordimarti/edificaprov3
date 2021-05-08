require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get switch" do
    get accounts_switch_url
    assert_response :success
  end
end
