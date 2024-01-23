class Item < ApplicationRecord
  mount_uploader :item_image, ItemImageUploader

  #validates :item_image_must_not_be_default
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 255 }

  belongs_to :user
  belongs_to :item_category
  has_many :item_colors
  has_many :colors, through: :item_colors

  def item_image_must_not_be_default
    if item_image.default_image?
        errors.add(:item_image, "を選択してください。")
    end
  end
end
