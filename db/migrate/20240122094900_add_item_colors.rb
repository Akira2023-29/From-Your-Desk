class AddItemColors < ActiveRecord::Migration[7.0]
  def change
    create_table :item_colors do |t|
      t.references :item, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
