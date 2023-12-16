class CreateDiagnosisTags < ActiveRecord::Migration[7.0]
  def change
    create_table :diagnosis_tags do |t|
      t.references :diagnosis, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
