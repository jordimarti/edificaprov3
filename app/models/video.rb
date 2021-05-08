class Video < ApplicationRecord
  acts_as_tenant(:user)
  
  has_many :video_ratings
  belongs_to :user
end
