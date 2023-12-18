class Tag < ApplicationRecord
    has_many :diagnosis_tags
    has_many :diagnoses, through: :diagnosis_tags
end
