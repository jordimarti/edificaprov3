require "test_helper"

class VideoTest < ActiveSupport::TestCase
  test "should not save video without title" do
    video = Video.new
    assert_not video.save
  end
end
