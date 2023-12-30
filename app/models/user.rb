class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar_image, AvatarImageUploader

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  has_many :diagnoses, dependent: :destroy
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_many :favorites, dependent: :destroy
  has_many :favorite_diagnoses, through: :favorites, source: :diagnosis

  def own?(object)
    id == object&.user_id
  end

  # お気に入り追加
  def favorite(diagnosis)
    favorite_diagnoses << diagnosis
  end

  # お気に入り解除
  def unfavorite(diagnosis)
    favorite_diagnoses.destroy(diagnosis)
  end

  # お気に入りしたか？
  def favorite?(diagnosis)
    favorite_diagnoses.include?(diagnosis)
  end
end
