class DiagnosesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @q = Diagnosis.ransack(params[:q])
    @diagnoses = @q.result(distinct: true).includes(:user, { place: :category }).order(created_at: :desc).page(params[:page]).per(8)
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def show
    @diagnosis = Diagnosis.find_by(id: params[:id])
    # 診断結果に応じたオススメ登録商品をDBからランダムに３つ表示
    @recommend_items = Item.joins(:colors).where('colors.name LIKE ?', "%#{@diagnosis.color_name.gsub(/（.*?）/, '')}%").order(Arel.sql('RANDOM()')).limit(3)
  end

  def favorites
    @q = current_user.favorite_diagnoses.ransack(params[:q])
    @favorite_diagnoses = @q.result(distinct: true).includes(:user, { place: :category }).order(created_at: :desc).page(params[:page]).per(8)
  end

  def diagnosis
    @diagnosis = current_user.diagnoses.build(diagnosis_params)
    # private配下メソッド実行
    process_image if params[:diagnosis][:desk_image].present?
    analyze_color_info if @diagnosis.color_info.present?
    translate_result if @diagnosis.result_en.present?

    if @diagnosis.save
      redirect_to diagnosis_path(@diagnosis), success: t('flash_message.diagnosed')
    else
      flash.now[:danger] = t('flash_message.not_diagnosed')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    diagnosis = current_user.diagnoses.find_by(id: params[:id])
    diagnosis.destroy!
    redirect_to diagnoses_path, success: t('flash_message.delete', item: Diagnosis.model_name.human)
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:desk_image, :desk_work, :desk_image_cache, :place_id)
  end

  # 画像診断・色情報抽出
  def process_image
    uploaded_image_path = params[:diagnosis][:desk_image].tempfile.path      # .tempfileメソッド：アップロードされたファイルが一時的に保存されているTempfileオブジェクトにアクセスするためのメソッド。
    analyze_result = GoogleCloudVisionApi.analyze_image(uploaded_image_path) # .pathメソッドでそのTempfileオブジェクトのファイルシステム上のパスを取得。(後続の処理で画像ファイルを読み込んだり、外部のAPIに送信したりするために使用されるパス)
    @diagnosis.color_info = analyze_result if analyze_result
  end

  # 診断文章生成
  def analyze_color_info
    response = OpenAiApi.chat(@diagnosis.color_info, @diagnosis.desk_work)
    @diagnosis.result_en = response.dig('choices', 0, 'message', 'content')
  end

  # 診断結果翻訳
  def translate_result
    translated_response = DeeplApi.translate(@diagnosis.result_en, 'JA') # 診断結果翻訳
    @diagnosis.color_name = translated_response.slice(/【(.*?)】/, 1).gsub(/（.*?）/, '') # 診断結果から色名を抽出（「色名（カタカナ）」の場合は（）部分を除去）
    @diagnosis.result_jp = translated_response
  end
end
