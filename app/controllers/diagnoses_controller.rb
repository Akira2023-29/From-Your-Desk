class DiagnosesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @diagnoses = Diagnosis.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def show
    @diagnosis = Diagnosis.find_by(id: params[:id])
  end

  def tagged
    @tagged_diagnoses = Diagnosis.includes(:user).joins(:tags).where(tags: { tag_name: params[:tag_name] }).order(created_at: :desc).page(params[:page])
  end

  def favorites
    @favorite_diagnoses = current_user.favorite_diagnoses.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def create
    @diagnosis = current_user.diagnoses.build(diagnosis_params)
  
    #.tempfileメソッドはアップロードされたファイルが一時的に保存されているTempfileオブジェクトにアクセスするためのメソッド。
    # .pathメソッドでそのTempfileオブジェクトのファイルシステム上のパスを取得。後続の処理で画像ファイルを読み込んだり、外部のAPIに送信したりするために使用されるパス)
    if params[:diagnosis][:desk_image].present?
      uploaded_image_path = params[:diagnosis][:desk_image].tempfile.path
    end
  
    if uploaded_image_path.present?
      analysis_result = GoogleCloudVisionApi.analyze_image(uploaded_image_path)
      @diagnosis.color_info = analysis_result
      @diagnosis.color_name = RakutenApi.color_name(analysis_result)
    end

    if @diagnosis.color_info.present?
      response = OpenAiApi.chat(@diagnosis.color_info, @diagnosis.desk_work, @diagnosis.place) 
      @diagnosis.result_en = response.dig("choices", 0, "message", "content") 
    end

    if @diagnosis.result_en.present?
      translated_response = DeeplApi.translate(@diagnosis.result_en, 'JA')
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
    params.require(:diagnosis).permit(:desk_image, :desk_work, :desk_image_cache, :category_id, :place_id)
  end
end
