require "test_helper"

class VideoRatingTest < ActiveSupport::TestCase
  test "valid if score is between 0 and 10" do
    rating = VideoRating.new(score: 10)
    rating.valid?
    assert_empty rating.errors[:score]
  end

  test "invalid if score is less than 0" do
    rating = VideoRating.new(score: -1)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

  test "invalid if score is greater than 10" do
    rating = VideoRating.new(score: 11)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

  test "promoter? returns true if score is 9 or 10" do
    rating = VideoRating.new(score: 9)
    assert rating.promoter?
  end

  test "promoter? returns false if score is less than 9" do
    rating = VideoRating.new(score: 1)
    assert_not rating.promoter?
  end

  test "promoter? returns false if score is greater than 10" do
    rating = VideoRating.new(score: 11)
    assert_not rating.promoter?
  end

  test "passive? returns true if score is 7 or 8" do
    7.upto(8).each do |i|
      rating = VideoRating.new(score: i)
      assert rating.passive?
    end
  end

  test "detractor? returns true if score is less than or equal to 6" do
    0.upto(6).each do |i|
      rating = VideoRating.new(score: i)
      assert rating.detractor?
    end
  end

  test "update video score cache when created" do
    video = videos(:one)
    video.video_ratings.create(score: 9)
    assert_equal 9, video.score
  end
end
