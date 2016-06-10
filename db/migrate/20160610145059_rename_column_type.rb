class RenameColumnType < ActiveRecord::Migration
  def change
    rename_column :planets, :type, :planet_type
  end
end
