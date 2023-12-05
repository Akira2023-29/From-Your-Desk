class ChangeDiagnoses < ActiveRecord::Migration[7.0]
  def change
        # board外部キーを削除
        remove_reference :diagnoses, :board, foreign_key: true
    
        # user外部キーを追加
        add_reference :diagnoses, :user, foreign_key: true
        
        # desk_imageカラムを追加
        add_column :diagnoses, :desk_image, :string
        
        # color_infoカラムを追加
        add_column :diagnoses, :color_info, :text
  end
end
