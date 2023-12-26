class AddDeskWorkToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :desk_work, :string
  end
end
