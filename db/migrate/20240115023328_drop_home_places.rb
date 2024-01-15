class DropHomePlaces < ActiveRecord::Migration[7.0]
  def change
    drop_table :home_places
  end
end
