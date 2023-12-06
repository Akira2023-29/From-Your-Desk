class DiagnosesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @diagnosis = Diagnosis.all
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

    # 解析結果をresultカラムにセット。
    uploaded_image_path = params[:diagnosis][:desk_image].tempfile.path
    analysis_result = @diagnosis.analyze_image(uploaded_image_path)

    # @diagnosis.result = JSON.dump(analysis_result) if analysis_result.present?

    if analysis_result.present?
      # 解析結果をマップして指定の形式に変換。
      @diagnosis.color_info = analysis_result.map do |item|
        # RGB値の値を抽出。
        color = item[:color].split(', ').map(&:to_i).join(", ")
        # 各色の全ピクセル数に対するピクセル数の比率を抽出（%)
        pixel_fraction = (item[:pixelFraction]).round(1)
        "#{color}: #{pixel_fraction}%"
      end
      # データベースに保存
      @diagnosis.save
      redirect_to diagnosis_path(@diagnosis), success: ('画像を解析したぞ・・・！')
    else
      flash.now[:danger] = '画像を解析できませんでした。'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:desk_image, :desk_image_cache)
  end
end
