class Diagnosis < ApplicationRecord
    mount_uploader :desk_image, DeskImageUploader 

    validates :desk_work, presence: true, length: { maximum: 255 }

    belongs_to :user

    has_many :diagnosis_tags, dependent: :destroy
    has_many :tags, through: :diagnosis_tags

    has_many :favorites, dependent: :destroy

end
