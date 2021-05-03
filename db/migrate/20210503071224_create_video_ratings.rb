class CreateVideoRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :video_ratings do |t|
      t.belongs_to :video, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
