class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diagnosis, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, %i[user_id diagnosis_id], unique: true
  end
end
