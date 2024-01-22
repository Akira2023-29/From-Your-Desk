class RemoveCategoryAndColorFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :category, :string
    remove_column :items, :color, :string
  end
end
