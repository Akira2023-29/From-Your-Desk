class CreateImageAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :image_analyses do |t|
      t.string :desk_image
      t.references :diagnosis, foreign_key: true

      t.timestamps
    end
  end
end
