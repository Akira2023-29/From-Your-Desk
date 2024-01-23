class Color < ApplicationRecord
    has_many :item_colors, dependent: :destroy
    has_many :items, through: :item_colors
end