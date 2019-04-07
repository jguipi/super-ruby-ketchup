class AddTitleAndDepartmentToReferent < ActiveRecord::Migration[5.0]
  def change
    add_column :referents, :title, :string
    add_column :referents, :departement, :string
  end
end
