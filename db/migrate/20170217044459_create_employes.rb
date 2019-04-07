class CreateEmployes < ActiveRecord::Migration[5.0]
  def change
    create_table :employes do |t|
      t.string :motDePasse
      t.date :dateEmbauche
      t.boolean :dejaEmbaucher
      t.boolean :estDisponible
      t.string :nom
      t.string :prenom
      t.string :courriel
      t.string :role
      t.integer :organisme_id

      t.timestamps
    end
  end
end
