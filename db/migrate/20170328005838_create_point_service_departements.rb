class CreatePointServiceDepartements < ActiveRecord::Migration[5.0]
  def change
    create_table :point_service_departements do |t|
      t.belongs_to :point_service, index: true
      t.belongs_to :departement, index: true
      t.timestamps
    end
  end
end
