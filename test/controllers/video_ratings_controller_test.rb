require "test_helper"

class VideoRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video_rating = video_ratings(:one)
  end

  test "should get index" do
    get video_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_video_rating_url
    assert_response :success
  end

  test "should create video_rating" do
    assert_difference('VideoRating.count') do
      post video_ratings_url, params: { video_rating: { score: @video_rating.score, video_id: @video_rating.video_id } }
    end

    assert_redirected_to video_rating_url(VideoRating.last)
  end

  test "should show video_rating" do
    get video_rating_url(@video_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_video_rating_url(@video_rating)
    assert_response :success
  end

  test "should update video_rating" do
    patch video_rating_url(@video_rating), params: { video_rating: { score: @video_rating.score, video_id: @video_rating.video_id } }
    assert_redirected_to video_rating_url(@video_rating)
  end

  test "should destroy video_rating" do
    assert_difference('VideoRating.count', -1) do
      delete video_rating_url(@video_rating)
    end

    assert_redirected_to video_ratings_url
  end
end
