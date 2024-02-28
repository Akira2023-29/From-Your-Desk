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
    url == default_url
  end

  # 詳細画面用の画像バージョン
  version :show do
    process resize_to_fit: [500, 300]
  end

  # 一覧画面用の画像バージョン
  version :index do
    process resize_to_fill: [500, 300]
  end

  # Google Cloud Vision API用の画像リサイズ
  version :google_cloud do
    process resize_to_fill: [300, 300]
  end

  # アップロード可能なファイルの拡張子を指定
  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
