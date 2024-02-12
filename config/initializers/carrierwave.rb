require 'carrierwave/storage/abstract' # 全てのストレージエンジンが継承する抽象ストレージクラスのロード
require 'carrierwave/storage/file'     # ローカルファイルシステムへのアップロードを可能にするストレージエンジンをロード
require 'carrierwave/storage/fog'      # fogを介したS3へのアップロードを可能にするストレージエンジンをロード

CarrierWave.configure do |config|
  case Rails.env
  when 'development', 'test'
    config.storage = :file
    config.cache_storage = :file
  else
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1' # AWSリージョン設定（ここでは東京リージョンを指定）
    }

    config.storage = :fog
    config.fog_directory = 'from-desk-color' # アップロードされたファイルを保存するS3のバケット（ディレクトリ）名
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/from-desk-color'    # ファイルへのURLが生成される際のベースURL
    config.cache_storage = :fog                                                      # アップロード前のキャッシュストレージとしてS3を使用することを指定。これにより、アップロード前の一時的なファイルもS3上に保存される。
    config.fog_public = false                                                        # ファイルへのアクセスを公開。falseに設定すると、生成されるURLは署名付きURLとなり、一定時間経過後にアクセスできなくなる。
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }    # S3にアップロードされるファイルに対するHTTPヘッダのデフォルト設定。
    # ここでは、cache_controlヘッダを設定して、ブラウザがキャッシュをどの程度の期間保持すべきかを指示している。
    # ここでは最大365日間キャッシュを保持するように設定。
  end
end
