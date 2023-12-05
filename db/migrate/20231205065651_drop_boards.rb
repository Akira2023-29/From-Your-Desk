class DropBoards < ActiveRecord::Migration[7.0]
  def change
    drop_table :boards
  end
end
