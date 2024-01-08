class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: t('flash_message.created', item: User.model_name.human)
    else
      flash.now[:danger] = t('flash_message.not_created', item: User.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar_image, :avatar_image_chche)
  end
end
