class Item < ApplicationRecord
  mount_uploader :item_image, ItemImageUploader

  #validates :item_image_must_not_be_default
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 255 }

  belongs_to :user
  belongs_to :item_category
  has_many :item_colors, dependent: :destroy
  has_many :colors, through: :item_colors
  has_many :bookmarks, dependent: :destroy

  def item_image_must_not_be_default
    if item_image.default_image?
        errors.add(:item_image, "を選択してください。")
    end
  end

  # 検索条件で使えるカラムを指定
  def self.ransackable_attributes(auth_object = nil)
      %w[id title body]
  end

  # 検索で使える関連付けを指定。placeモデルの検索を許可。
  def self.ransackable_associations(auth_object = nil)
      %w[colors item_category] 
  end
end
