class Place < ApplicationRecord
    belongs_to :category
    has_many :diagnoses, dependent: :destroy
end
