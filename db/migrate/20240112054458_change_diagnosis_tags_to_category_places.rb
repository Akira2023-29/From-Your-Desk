class ChangeDiagnosisTagsToCategoryPlaces < ActiveRecord::Migration[7.0]
  def change
    rename_table :diagnosis_tags, :category_places
    remove_column :category_places, :diagnosis_id
    remove_column :category_places, :tag_id
    add_column :category_places, :category_id, :bigint
    add_column :category_places, :place_id, :bigint

    # remove_index :category_places, name: "index_diagnosis_tags_on_diagnosis_id_and_tag_id"
    # remove_index :category_places, name: "index_diagnosis_tags_on_diagnosis_id"
    # remove_index :category_places, name: "index_diagnosis_tags_on_tag_id"

    add_index :category_places, %i[category_id place_id], unique: true
    add_index :category_places, :category_id
    add_index :category_places, :place_id
  end
end
