class Tag < ApplicationRecord
    has_many :diagnosis_tags, dependent: :destroy
    has_many :diagnoses, through: :diagnosis_tags
end
