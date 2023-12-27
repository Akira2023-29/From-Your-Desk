class AddAvatarImageUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar_image_url, :string
  end
end
