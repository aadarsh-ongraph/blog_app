class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :userblogs, :likes, :likescount
  end
end
