class AddActiveFieldToReferent < ActiveRecord::Migration[5.0]
  def change
    add_column :referents, :active, :boolean
  end
end
