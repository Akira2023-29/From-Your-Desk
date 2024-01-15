class AddCategoryAndPlaceToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :category_id, :integer
    add_column :diagnoses, :place_id, :integer
    add_foreign_key :diagnoses, :categories
    add_foreign_key :diagnoses, :places
  end
end
