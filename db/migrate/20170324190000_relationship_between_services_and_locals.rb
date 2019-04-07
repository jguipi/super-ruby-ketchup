class RelationshipBetweenServicesAndLocals < ActiveRecord::Migration[5.0]
  def change
    create_table :locals_services, id: false do |t|
      t.belongs_to :local, index: true
      t.belongs_to :service, index: true
    end
  end
end
