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
    @q = current_user.bookmark_items.ransack(params[:q])
    @bookmark_items = @q.result(distinct: true).includes(:user, :item_category, :colors).order(created_at: :desc).page(params[:page])
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to item_path(@item), success: t('flash_message.item_save')
    else
      flash.now[:danger] = t('flash_message.not_item_save')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), success: t('flash_message.item_update')
    else
      flash.now[:danger] = t('flash_message.not_item_update')
      render :edit, status: :unprocessable_entity
    end

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


