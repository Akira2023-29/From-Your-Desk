class Color < ApplicationRecord
    has_many :item_colors, dependent: :destroy
end