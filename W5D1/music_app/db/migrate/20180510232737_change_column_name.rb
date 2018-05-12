class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :albums, :type, :recording_type
  end
end
