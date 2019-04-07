class RemoveUnwantedTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :welcomes
    drop_table :titles
    drop_table :tests
    drop_table :posts
  end
end
