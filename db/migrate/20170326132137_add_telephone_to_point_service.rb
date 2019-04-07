class AddTelephoneToPointService < ActiveRecord::Migration[5.0]
  def change
    add_column :point_services, :telephone, :string
  end
end
