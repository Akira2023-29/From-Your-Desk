# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_select_menu
  add_flash_types :success, :danger

  private

  def not_authenticated
    redirect_to login_path, danger: 'ログインしてください'
  end

  def set_select_menu
    @categories = Category.all
    @office_places = Place.where(category_id: 1)
    @home_places = Place.where(category_id: 2)
  end
end
