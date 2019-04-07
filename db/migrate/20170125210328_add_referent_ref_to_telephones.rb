class AddReferentRefToTelephones < ActiveRecord::Migration[5.0]
  def change
    add_reference :telephones, :referent, foreign_key: true
  end
end
