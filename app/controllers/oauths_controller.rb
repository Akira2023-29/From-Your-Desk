class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    # 指定したプロバイダの認証ページにユーザーをリダイレクト(Google認証ページにリダイレクト)。
    login_at(auth_params[:provider])
  end

  # Google認証承諾後にcallbackアクションへリダイレクト。
  def callback
    provider = auth_params[:provider]
    # 既存のユーザーをOAuth認証情報を元に検索。
    if (@user = login_from(provider)) # ユーザーがデータベースに存在する場合。
      redirect_to diagnoses_path, success: t('.google_login')
    elsif signup_and_login(provider)
      redirect_to diagnoses_path, success: t('.google_login')
    else # 例外処理
      redirect_to login_path, danger: t('.not_google_login')
    end
  end

  private

  # :code 外部サービスの認証が成功した後に返される認証コード
  def auth_params
    params.permit(:code, :provider)
  end

  # プロバイダ情報を元に新規ユーザー作成・ログイン
  def signup_and_login(provider)
    @user = create_from(provider) # user_info_mappingで設定したカラムに対応する情報を保存
    reset_session # セッション固定攻撃（session fixation attack）を防ぐため現在のセッションをリセットし、新しいセッションを開始。
    auto_login(@user)
  end
end
