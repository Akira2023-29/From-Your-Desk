class DiagnosesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @q = Diagnosis.ransack(params[:q])
    @diagnoses = @q.result(distinct: true).includes(:user, { place: :category }).order(created_at: :desc).page(params[:page])
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def show
    @diagnosis = Diagnosis.find_by(id: params[:id])
    # 診断結果にあった登録商品をランダムに３つ取得
    @recommend_items = Item.joins(:colors).where("colors.name LIKE ?", "%#{@diagnosis.color_name}%").order(Arel.sql("RANDOM()")).limit(3)
  end

  def favorites
    @q = current_user.favorite_diagnoses.ransack(params[:q])
    @favorite_diagnoses = @q.result(distinct: true).includes(:user, { place: :category }).order(created_at: :desc).page(params[:page])
  end

  def diagnosis
    @diagnosis = current_user.diagnoses.build(diagnosis_params)
  
    #.tempfileメソッド：アップロードされたファイルが一時的に保存されているTempfileオブジェクトにアクセスするためのメソッド。
    # .pathメソッドでそのTempfileオブジェクトのファイルシステム上のパスを取得。(後続の処理で画像ファイルを読み込んだり、外部のAPIに送信したりするために使用されるパス)
    if params[:diagnosis][:desk_image].present?
      uploaded_image_path = params[:diagnosis][:desk_image].tempfile.path
    end
  
    if uploaded_image_path.present?
      analysis_result = GoogleCloudVisionApi.analyze_image(uploaded_image_path)
      @diagnosis.color_info = analysis_result
    end

    if @diagnosis.color_info.present? && @diagnosis.place_id.present?
      response = OpenAiApi.chat(@diagnosis.color_info, @diagnosis.desk_work, Place.find_by(id: @diagnosis.place_id).name)
      @diagnosis.result_en = response.dig("choices", 0, "message", "content") 
    end

    if @diagnosis.result_en.present?
      # 診断結果翻訳
      translated_response = DeeplApi.translate(@diagnosis.result_en, 'JA')
      # 診断結果からデスク環境に取り入れるべき色名を抽出
      @diagnosis.color_name = translated_response.slice(/【(.*?)】/, 1)
      # 診断結果全文
      @diagnosis.result_jp = translated_response
    end

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
end
