class AddPointServiceIdToLocal < ActiveRecord::Migration[5.0]
  def change
    change_table :locals do |t|
      t.belongs_to :point_service
    end
  end
end
