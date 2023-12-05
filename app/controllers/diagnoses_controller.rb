class DiagnosesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:desk_image)
  end
end
