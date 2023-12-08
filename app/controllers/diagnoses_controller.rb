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
    uploaded_image_path = params[:diagnosis][:desk_image].tempfile.path
    # 解析結果をresultカラムにセット。
    analysis_result = @diagnosis.analyze_image(uploaded_image_path)

    # 色情報をcolor_infoカラムにセット。
    if analysis_result.present?
      # 解析結果をマップして指定の形式に変換。
      @diagnosis.color_info = analysis_result.map do |item|
        # RGB値の値を抽出。
        color = item[:color].split(', ').map(&:to_i).join(", ")
        # 各色の支配率スコア（%)を抽出。
        score = (item[:score]).round(1)
        "#{color}: #{score}%"
      end
    end

    if @diagnosis.color_info.present?
      # @diagnosis.result_en = JSON.dump(analysis_result)
      @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
      response = @client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          max_tokens: 180,
          temperature: 0.5,
          messages: [
            {
              role: "system", content:  "You are an expert on the impact of color on desk work productivity. What is your advice on how to improve work productivity based on the color balance of a given desk environment?
              # Conditions
              Answer within 200 characters.
              These are some of the effects that each color has on desk work productivity
                Red: symbolizes energy and vitality. Excessive use can cause aggression and stress.
                Blue: Promotes calmness and concentration. Suitable for intellectual work with a rapid psychological time lapse.
                Green: brings relaxation and peace of mind and reduces stress. The green color of plants symbolizes productivity.
                Yellow: symbolizes brightness and vitality and stimulates creativity. Too much can cause anxiety and irritability.
                Pink: symbolizes relaxation and calmness.
                Purple: symbolizes nobility and luxury and stimulates creativity.
                Orange: symbolizes energy and vitality and stimulates creativity.
                Brown: symbolizes stability and trust.
                Black: symbolizes strength and professionalism. Overuse can cause feelings of oppression and negativity.
                White: symbolizes cleanliness and simplicity, reduces visual distractions and improves concentration."
            },
            {
              role: "user", content: "Based on the color balance of the given desk environment, briefly tell us about your 「color balance assessment」 and 「advice for improving desk productivity」!
              # Results of the color balance analysis of the desk environment
              (=#{@diagnosis.color_info})"
            }
          ]
        }
      )
      # 翻訳前の回答をresult_enカラムにセット。
      @diagnosis.result_en = response.dig("choices", 0, "message", "content")
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
