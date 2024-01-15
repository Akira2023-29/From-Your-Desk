class RemoveCategoryIdFromDiagnoses < ActiveRecord::Migration[7.0]
  def change
    remove_column :diagnoses, :category_id, :integer
  end
end
