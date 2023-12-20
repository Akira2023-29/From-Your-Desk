class FavoritesController < ApplicationController
  def create
    diagnosis = Diagnosis.find(params[:diagnosis_id])
    current_user.favorite(diagnosis)
  end

  def destroy
    diagnosis = current_user.favorites.find(params[:id]).diagnosis
    current_user.unfavorite(diagnosis)
  end
end
