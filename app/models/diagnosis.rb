class Diagnosis < ApplicationRecord
    mount_uploader :desk_image, DeskImageUploader 

    validate :desk_image_must_not_be_default
    validates :place_id, presence: true
    validates :desk_work, presence: true, length: { maximum: 255 }

    belongs_to :user
    belongs_to :place

    has_many :favorites, dependent: :destroy

    def desk_image_must_not_be_default
        if desk_image.default_image?
            errors.add(:desk_image, "を選択してください。")
        end
    end

    def self.ransackable_attributes(auth_object = nil)
        ["desk_work", "id", "place_id", "place_category_id"]
    end
end
