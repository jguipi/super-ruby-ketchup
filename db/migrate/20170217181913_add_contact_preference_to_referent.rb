class AddContactPreferenceToReferent < ActiveRecord::Migration[5.0]
  def change
    add_column :referents, :preferenceContact, :string
  end
end
