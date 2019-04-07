class CreatePointServices < ActiveRecord::Migration[5.0]
  def change
    create_table :point_services do |t|
      t.string :nom
      t.string :courriel
      t.string :fax
      t.string :siteWeb
      t.string :string

      t.timestamps
    end
  end
end
