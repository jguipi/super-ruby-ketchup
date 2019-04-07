class RemoveUnwantedTablesAndUnwantedFields < ActiveRecord::Migration[5.0]
  def change
    drop_table :telephone_organismes
    remove_column :organismes, :telephoneOrganisme_id
  end
end
