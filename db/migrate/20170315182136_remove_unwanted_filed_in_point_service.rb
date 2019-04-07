class RemoveUnwantedFiledInPointService < ActiveRecord::Migration[5.0]
  def change
    remove_column :point_services, :string
    remove_column :point_services, :siteWeb
  end
end
