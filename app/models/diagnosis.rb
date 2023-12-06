class Diagnosis < ApplicationRecord
    mount_uploader :desk_image, DeskImageUploader 

    belongs_to :user

    validates :result, presence: true, length: { maximum: 200 }
end
