class ChangeDiagnoses < ActiveRecord::Migration[7.0]
  def change
        # user外部キーを追加
        add_reference :diagnoses, :user, foreign_key: true
        
        # desk_imageカラムを追加
        add_column :diagnoses, :desk_image, :string
        
        # color_infoカラムを追加
        add_column :diagnoses, :color_info, :text
  end
end
