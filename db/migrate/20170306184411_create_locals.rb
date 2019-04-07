class CreateLocals < ActiveRecord::Migration[5.0]
  def change
    create_table :locals do |t|
      t.string :nom
      t.integer :nombrePlaces

      t.timestamps
    end
  end
end
