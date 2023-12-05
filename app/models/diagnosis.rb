class Diagnosis < ApplicationRecord
    mount_uploader :desk_image, DeskImageUploader 
    
    belongs_to :user
end
