class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item_category
  has_many :item_colors, dependent: :destroy
end
