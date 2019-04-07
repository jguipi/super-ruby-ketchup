class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :educations, :type, :type_education
  end
end
