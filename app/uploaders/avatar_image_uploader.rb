class AvatarImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #画像が存在しない時にデフォルトで表示する画像のURLを設定する
  def default_url
    '/avatar/ruby.icon.jpeg'
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
    process resize_to_fit: [150, 150]
  # end

  #アップロード可能なファイルの拡張子を指定
  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  # googleアカウントのリモートURLからプロフィール画像をダウンロード・保存
  def download_and_store_image
    if model.avatar_image_url.presebt? && model.avatar_image.blank?
      model.remote_avatar_image_url = model.avatar_image_url
      model.save! # Userモデルに保存
    end
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg"
  # end
end
