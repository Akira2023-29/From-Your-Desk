class RenameAvatarImageUrlInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :avatar_image_url, :google_avatar_image
  end
end
