class AddRoleToAffiliation < ActiveRecord::Migration[6.1]
  def change
    add_column :affiliations, :role, :string
  end
end
