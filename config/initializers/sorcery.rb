Rails.application.config.sorcery.submodules = %i[external reset_password]

Rails.application.config.sorcery.configure do |config|
  # Googleを外部認証のプロバイダーとして設定。
  config.external_providers = %i[google]

  config.google.key = ENV['GOOGLE_CLIENT_ID']
  config.google.secret = ENV['GOOGLE_CLIENT_SECRET']
  # API設定で承認済みのリダイレクトURIとして登録したurlを設定
  config.google.callback_url = Settings.sorcery[:google_callback_url]
  config.google.user_info_mapping = { email: 'email', name: 'name', google_avatar_image: 'picture' }
  config.google.scope = 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile'
  
  config.user_class = 'User'

  config.user_config do |user|
    user.stretches = 1 if Rails.env.test?
    user.reset_password_mailer = UserMailer
    # 外部サービスとの認証情報を保存するモデルを指定
    user.authentications_class = Authentication
  end
end
