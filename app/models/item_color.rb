class ItemColor < ApplicationRecord
  belongs_to :item
  belongs_to :color
end
