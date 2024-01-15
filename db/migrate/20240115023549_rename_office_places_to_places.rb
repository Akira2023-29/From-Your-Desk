class RenameOfficePlacesToPlaces < ActiveRecord::Migration[7.0]
  def change
    rename_table :office_places, :places
  end
end
