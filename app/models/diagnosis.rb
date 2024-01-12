class Diagnosis < ApplicationRecord
    mount_uploader :desk_image, DeskImageUploader 

    validate :desk_image_must_not_be_default
    validates :tag_ids, presence: true
    validates :desk_work, presence: true, length: { maximum: 255 }

    belongs_to :user
    belongs_to :category
    belongs_to :place

    has_many :diagnosis_tags, dependent: :destroy
    has_many :favorites, dependent: :destroy

    def desk_image_must_not_be_default
        if desk_image.default_image?
            errors.add(:desk_image, "を選択してください。")
        end
    end
end
