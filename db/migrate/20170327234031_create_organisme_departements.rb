class CreateOrganismeDepartements < ActiveRecord::Migration[5.0]
  def change
    create_table :organisme_departements do |t|
      t.belongs_to :organisme, index: true
      t.belongs_to :departement, index: true
      t.timestamps
    end
  end
end
