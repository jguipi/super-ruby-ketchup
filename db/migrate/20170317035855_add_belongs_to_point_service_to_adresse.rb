class AddBelongsToPointServiceToAdresse < ActiveRecord::Migration[5.0]
  def change
    change_table :adresses do |t|
      t.belongs_to :point_service
    end
  end
end
