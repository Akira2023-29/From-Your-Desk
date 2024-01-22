class ChangeItemColorsToColors < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :item_colors, :items
    remove_reference :item_colors, :item, index: true
    rename_table :item_colors, :colors
  end
end
