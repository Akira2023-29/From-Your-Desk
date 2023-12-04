class ImageAnalysesController < ApplicationController
  def index
  end

  def new
    @iamge_analysis = ImageAnalysis.new
  end

  def show
  end

  def create
  end

  def destroy
  end

  private
    def set_image
      @image_analysis
    end

    def image_analysis_params
      params.require(:image_analysis).permit(:desk_image, :desk_image_cache)
    end
end
