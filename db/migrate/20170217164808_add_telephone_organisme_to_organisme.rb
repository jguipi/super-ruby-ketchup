class AddTelephoneOrganismeToOrganisme < ActiveRecord::Migration[5.0]
  def change
    add_column :organismes, :telephoneOrganisme_id, :integer
  end
end
