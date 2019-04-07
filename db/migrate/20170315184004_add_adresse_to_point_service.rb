class AddAdresseToPointService < ActiveRecord::Migration[5.0]
  def change
    add_column :point_services, :adresse_id, :integer
  end
end
