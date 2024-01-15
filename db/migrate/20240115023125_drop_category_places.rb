class DropCategoryPlaces < ActiveRecord::Migration[7.0]
  def change
    drop_table :category_places
  end
end
