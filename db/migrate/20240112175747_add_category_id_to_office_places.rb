class AddCategoryIdToOfficePlaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :office_places, :category, foreign_key: true, null: true
  end
end
