class AddForeignKeyToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :diagnoses, :places, column: :place_id
  end
end
