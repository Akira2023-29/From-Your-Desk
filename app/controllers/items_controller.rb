class ItemsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(destinct: :true).includes(:user, :item_category, :colors).order(created_at: :desc).page(params[:page])
  end

  def new
    @item = Item.new
  end

  def bookmarks
    @bookmark_items = current_user.bookmark_items
    # @q = current_user.bookmark_items.ransack(params[:q])
    # @bookmark_items = @q.result(distinct: true).includes(:use, :item_category, :color).order(created_at: :desc).page(params[:page])
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path(@item), success: t('flash_message.item_save')
    else
      flash.now[:danger] = t('flash_message.not_item_save')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def destroy
    item = current_user.items.find_by(id: params[:id])
    item.destroy!
    redirect_to items_path, success: t('flash_message.delete', item: Item.model_name.human)
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_image_cache, :title, :body, :item_url, :item_category_id, color_ids: [])
  end
end


