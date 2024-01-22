class Item < ApplicationRecord
  belongs_to :user
  has_many :item_category, dependent: :destroy
end
