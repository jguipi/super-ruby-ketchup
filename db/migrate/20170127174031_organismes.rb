class Organismes < ActiveRecord::Migration[5.0]
  def change
    create_table :organismes
    add_column :organismes, :name, :string
    add_column :organismes, :mail, :string
    add_column :organismes, :web_site, :string
  end
end
