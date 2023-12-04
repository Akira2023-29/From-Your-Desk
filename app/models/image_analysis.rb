class ImageAnalysis < ApplicationRecord
    mount_uploader :desk_image, DeskImageUploader 
end
