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
    @place_list_office = Place.where(id: [23, 24])
    @place_list_home = Place.where(id: [18..22])
  end
end
