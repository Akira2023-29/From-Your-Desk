class Category < ApplicationRecord
    has_many :diagnoses, dependent: :destroy
    has_many :places, through: :category_places
end
