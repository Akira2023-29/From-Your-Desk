class DeskImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # ストレージの種類を選択。
  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # アップロードファイルを保存するディレクトリを指定
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 画像が存在しない時にデフォルトで表示する画像のURLを設定する
  def default_url
    '/sample.jpg'
  end

  # デフォルト画像のままか判定
  def default_image?
    url === default_url
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # 詳細画面用の画像バージョン
  version :show do
    process resize_to_fit: [500, 300]
  end

  # 一覧画面用の画像バージョン
  version :index do
    process resize_to_fill: [500, 300]
  end

  # アップロード可能なファイルの拡張子を指定
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg"
  # end
end
