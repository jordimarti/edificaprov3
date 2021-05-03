require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "has first name" do
    assert_equal "Jordi", users(:castella).first_name
  end
end
