class CreateItemCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :item_categories do |t|
      t.references :item, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
