class Item < ApplicationRecord
  mount_uploader :item_image, ItemImageUploader

  validate :item_image_must_not_be_default
  validate :validate_color_selection
  validates :title, presence: true, length: { maximum: 255 }
  validates :color_ids, presence: true
  validates :body, presence: true, length: { maximum: 255 }

  belongs_to :user
  belongs_to :item_category
  has_many :item_colors, dependent: :destroy
  has_many :colors, through: :item_colors
  has_many :bookmarks, dependent: :destroy

  # 登録するアイテム画像を添付したか？
  def item_image_must_not_be_default
    return unless item_image.default_image?

    errors.add(:item_image, 'を選択してください。')
  end

  # アイテム登録時に選択できる色分類数を制限
  def validate_color_selection
    return unless color_ids.count > 3

    errors.add(:color_ids, 'は3つまでしか選択できません。')
  end

  # 検索条件で使えるカラムを指定
  def self.ransackable_attributes(_auth_object = nil)
    %w[id title body]
  end

  # 検索で使える関連付けを指定。placeモデルの検索を許可。
  def self.ransackable_associations(_auth_object = nil)
    %w[colors item_category]
  end
end
