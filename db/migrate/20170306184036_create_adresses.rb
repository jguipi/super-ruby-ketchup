class CreateAdresses < ActiveRecord::Migration[5.0]
  def change
    create_table :adresses do |t|
      t.string :rue
      t.string :string
      t.string :ville
      t.string :string
      t.string :pays
      t.string :string
      t.string :codePostal

      t.timestamps
    end
  end
end
