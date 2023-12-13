class Diagnosis < ApplicationRecord
    mount_uploader :desk_image, DeskImageUploader 

    belongs_to :user

    # validates :desk_image, presence: true, length: { maximum: 200 }
    # validates :color_info, presence: true, length: { maximum: 200 }

end
