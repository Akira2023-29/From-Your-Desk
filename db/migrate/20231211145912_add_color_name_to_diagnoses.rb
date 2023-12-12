class AddColorNameToDiagnoses < ActiveRecord::Migration[7.0]
  def change
    add_column :diagnoses, :color_name, :string
  end
end
