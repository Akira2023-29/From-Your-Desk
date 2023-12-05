class CreateDiagnoses < ActiveRecord::Migration[7.0]
  def change
    create_table :diagnoses do |t|
      t.text :result_en
      t.text :result_jp
      # t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
