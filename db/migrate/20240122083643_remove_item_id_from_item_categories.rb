class RemoveItemIdFromItemCategories < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :item_categories, :items
    remove_reference :item_categories, :item, index: true
  end
end
