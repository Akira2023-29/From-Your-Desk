class AddUniqueIndexToDiagnosisTags < ActiveRecord::Migration[7.0]
  def change
    add_index :diagnosis_tags, %i[diagnosis_id tag_id], unique: true
  end
end
