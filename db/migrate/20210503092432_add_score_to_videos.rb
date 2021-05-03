class AddScoreToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :score, :integer
  end
end
