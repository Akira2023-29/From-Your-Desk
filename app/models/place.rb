class Place < ApplicationRecord
    has_many :diagnoses, dependent: :destroy
    has_many :categories, through: :category_places
end
