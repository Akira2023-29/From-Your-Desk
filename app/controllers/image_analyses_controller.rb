class ImageAnalysesController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @iamge_analysis = ImageAnalysis.new
  end

  def create
    binding.pry
    
    @iamge_analysis = ImageAnalysis.new(image_analysis_params)
    if @iamge_analysis.save
      redirect_to diagnoses_path, success: ('ユーザー登録が成功しました！')
    else
      flash.now[:danger] = ('ユーザー登録に失敗しました')
      render diagnoses_new_path, status: :unprocessable_entity
    end
  end

  private
    def set_image
      @image_analysis = ImageAnalysis.find(params[:id])
    end

    def image_analysis_params
      params.require(:image_analysis).permit(:desk_image, :desk_image_cache)
    end
end
