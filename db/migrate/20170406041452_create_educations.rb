class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :type
      t.string :name
      t.date :date_completed
      t.references :employe, foreign_key: true

      t.timestamps
    end
  end
end
