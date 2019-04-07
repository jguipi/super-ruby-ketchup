class AddOrganismeToReferent < ActiveRecord::Migration[5.0]
  def change
    add_column :referents, :organisme_id, :integer
  end
end
