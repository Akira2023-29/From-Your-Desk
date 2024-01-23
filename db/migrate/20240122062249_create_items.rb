class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.string :category
      t.string :color
      t.string :item_image
      t.string :item_url

      t.timestamps
    end
  end
end
