class DiagnosesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @diagnoses = Diagnosis.all.includes(:user).order(created_at: :desc)
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def show
    @diagnosis = Diagnosis.find_by(id: params[:id])
  end

  def edit
  end

  def create
    @diagnosis = current_user.diagnoses.build(diagnosis_params)

    #.tempfile はアップロードされたファイルが一時的に保存されているTempfileオブジェクトにアクセスするためのメソッド。
    # .path はそのTempfileオブジェクトのファイルシステム上のパスを取得している。
    # これは、後続の処理で画像ファイルを読み込んだり、外部のAPIに送信したりするために使用されるパス。
    uploaded_image_path = params[:diagnosis][:desk_image].tempfile.path

    # 色情報をcolor_infoカラムにセット。
    if uploaded_image_path.present?
      analysis_result = GoogleCloudVisionApi.analyze_image(uploaded_image_path)
      @diagnosis.color_info = analysis_result    # 解析結果をマップして指定の形式に変換。
    end

    # 翻訳前の回答をresult_enカラムにセット。
    if @diagnosis.color_info.present?
      response = OpenAiApi.chat(@diagnosis.color_info) 
      @diagnosis.result_en = response.dig("choices", 0, "message", "content") 
    end

    # 翻訳後の回答をresult_jpカラムにセット。
    if @diagnosis.result_en.present?
      translated_response = DeeplApi.translate(@diagnosis.result_en, 'JA')
      @diagnosis.result_jp = translated_response
    end

    # データベースに保存
    if @diagnosis.save
      redirect_to diagnosis_path(@diagnosis), success: ('画像を解析したぞ・・・！')
    else
      flash.now[:danger] = '画像を解析できませんでした。'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    diagnosis = current_user.diagnoses.find_by(id: params[:id])
    diagnosis.destroy!
    redirect_to diagnoses_path, success: ('削除しました')
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:desk_image, :desk_image_cache)
  end
end
