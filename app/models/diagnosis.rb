class Diagnosis < ApplicationRecord
  mount_uploader :desk_image, DeskImageUploader

  validate :desk_image_must_not_be_default
  validate :user_diagnosis_limit, on: :create
  validate :validate_image_analysis, on: :create
  validates :place_id, presence: true
  validates :desk_work, presence: true, length: { maximum: 255 }

  belongs_to :user
  belongs_to :place

  has_many :favorites, dependent: :destroy

  # 診断する写真を添付したか？
  def desk_image_must_not_be_default
    return unless desk_image.default_image?
    errors.add(:desk_image, 'を選択してください。')
  end

  # Google Cloud Vision APIの解析結果検証
  def validate_image_analysis
    return unless color_info.blank?
    errors.add(:base, :image_analysis_failed, message: '写真から十分なデスク領域が見つかりませんでした。')
  end

  # 検索条件で使えるカラムを指定
  def self.ransackable_attributes(_auth_object = nil)
    %w[desk_work id place_id]
  end

  # 検索で使える関連付けを指定。placeモデルの検索を許可。
  def self.ransackable_associations(_auth_object = nil)
    %w[place]
  end

  private

  # 診断機能を1日2回までに制限
  def user_diagnosis_limit
    today_diagnoses = user.diagnoses.where('created_at >= ?', Time.zone.now.beginning_of_day)
    return unless today_diagnoses.count >= 2
    errors.add(:base, '1日の診断回数の上限に達しました。')
  end
end
