class CreateTelephoneOrganismes < ActiveRecord::Migration[5.0]
  def change
    create_table :telephone_organismes do |t|
      t.string :bureau
      t.string :telecopie

      t.timestamps
    end
  end
end
