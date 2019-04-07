class CreateTelephones < ActiveRecord::Migration[5.0]
  def change
    create_table :telephones do |t|
      t.string :number
      t.string :numberType

      t.timestamps
    end
  end
end
