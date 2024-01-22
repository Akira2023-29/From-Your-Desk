class AddItemCategoryIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :item_category, foreign_key: true
  end
end
