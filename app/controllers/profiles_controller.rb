class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit show update]

  def show
    @diagnoses = current_user.diagnoses
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('flash_message.update', item: User.model_name.human)
    else
      flash.now[:danger] = t('flash_message.not_update', item: User.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar_image, :avatar_image_cache, :google_avatar_image, :google_avatar_image_cache)
  end
end
