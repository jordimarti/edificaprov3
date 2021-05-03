require "test_helper"

class VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video = videos(:one)
    sign_in users(:catala)
  end

  test "redirected if not logged in index" do
    sign_out :user
    get videos_url, headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
    assert_response :redirect
  end

  test "should get index" do
    get videos_url, headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
    assert_response :success
  end

  test "should get new" do
    get new_video_url, headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
    assert_response :success
  end

  test "should create video" do
    assert_difference('Video.count') do
      post videos_url, params: { video: { title: @video.title } }, headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
    end

    assert_redirected_to video_url(Video.last)
  end

  test "should show video" do
    get video_url(@video), headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
    assert_response :success
  end

  test "should get edit" do
    get edit_video_url(@video), headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
    assert_response :success
  end

  test "should update video" do
    patch video_url(@video), params: { video: { title: @video.title } }, headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
    assert_redirected_to video_url(@video)
  end

  #test "should destroy video" do
  #  assert_difference('Video.count', -1) do
  #    delete video_url(@video), headers: { "HTTP_ACCEPT_LANGUAGE" => "ca" }
  #  end

  #  assert_redirected_to videos_url
  #end
end
