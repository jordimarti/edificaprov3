json.extract! video_rating, :id, :video_id, :score, :created_at, :updated_at
json.url video_rating_url(video_rating, format: :json)
