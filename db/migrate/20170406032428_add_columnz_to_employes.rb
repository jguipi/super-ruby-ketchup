class AddColumnzToEmployes < ActiveRecord::Migration[5.0]
  def change
    add_column :employes, :telephone_travail, :string
    add_column :employes, :telephone_home, :string
    add_column :employes, :telephone_cellulaire, :string
  end
end
