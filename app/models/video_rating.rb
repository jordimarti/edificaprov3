class VideoRating < ApplicationRecord
  belongs_to :video
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  # Promoter is 9 or 10, Passive is 7 or 8, below that is Detractor
  def promoter?
    score >= 9 && score <= 10
  end

  def passive?
    score >= 7 && score <= 8
  end

  def detractor?
    score < 7
  end

  after_create do
    video.update(score: score)
  end
end
