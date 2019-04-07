class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :nom
      t.string :description
      t.float :tarification
      t.boolean :estSubventionner
      t.float :tarificationCISSS

      t.timestamps
    end
  end
end
