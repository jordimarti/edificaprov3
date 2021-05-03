require "application_system_test_case"

class VideoRatingsTest < ApplicationSystemTestCase
  setup do
    @video_rating = video_ratings(:one)
  end

  test "visiting the index" do
    visit video_ratings_url
    assert_selector "h1", text: "Video Ratings"
  end

  test "creating a Video rating" do
    visit video_ratings_url
    click_on "New Video Rating"

    fill_in "Score", with: @video_rating.score
    fill_in "Video", with: @video_rating.video_id
    click_on "Create Video rating"

    assert_text "Video rating was successfully created"
    click_on "Back"
  end

  test "updating a Video rating" do
    visit video_ratings_url
    click_on "Edit", match: :first

    fill_in "Score", with: @video_rating.score
    fill_in "Video", with: @video_rating.video_id
    click_on "Update Video rating"

    assert_text "Video rating was successfully updated"
    click_on "Back"
  end

  test "destroying a Video rating" do
    visit video_ratings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Video rating was successfully destroyed"
  end
end
