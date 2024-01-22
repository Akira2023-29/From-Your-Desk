class ItemsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @items = Item.all.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def destroy
  end
end
