class RenamePlacesToOfficePlaces < ActiveRecord::Migration[7.0]
  def change
    rename_table :places, :office_places
  end
end
