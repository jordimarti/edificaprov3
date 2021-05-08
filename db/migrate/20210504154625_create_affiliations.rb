class CreateAffiliations < ActiveRecord::Migration[6.1]
  def change
    create_table :affiliations do |t|
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
