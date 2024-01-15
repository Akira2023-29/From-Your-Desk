class RenameTagsToPlacesAndChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_table :tags, :places
    remove_column :places, :tag_name
    add_column :places, :name, :string
  end
end
