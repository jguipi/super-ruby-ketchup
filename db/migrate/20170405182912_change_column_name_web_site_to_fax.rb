class ChangeColumnNameWebSiteToFax < ActiveRecord::Migration[5.0]
  def change
    rename_column :organismes, :web_site, :fax
  end
end
