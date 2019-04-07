class CreateDepartements < ActiveRecord::Migration[5.0]
  def change
    create_table :departements do |t|
      t.string :description

      t.timestamps
    end
  end
end
