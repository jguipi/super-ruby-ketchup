class OrganismeIdToPointService < ActiveRecord::Migration[5.0]
  def change
    add_column :point_services, :organisme_id, :integer
  end
end
