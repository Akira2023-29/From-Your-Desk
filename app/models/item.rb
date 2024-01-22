class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item_category
  has_many :item_colors
  has_many :colors, through: :item_colors
end
