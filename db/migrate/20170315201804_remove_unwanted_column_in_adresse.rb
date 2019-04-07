class RemoveUnwantedColumnInAdresse < ActiveRecord::Migration[5.0]
  def change
    remove_column :adresses, :string
  end
end
