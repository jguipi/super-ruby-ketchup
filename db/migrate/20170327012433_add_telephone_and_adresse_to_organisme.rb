class AddTelephoneAndAdresseToOrganisme < ActiveRecord::Migration[5.0]
  def change
    add_column :organismes, :telephone, :string
    add_column :organismes, :adresse, :string
  end
end
