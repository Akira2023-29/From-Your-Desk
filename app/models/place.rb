class Place < ApplicationRecord
    belongs_to :category
    has_many :diagnoses, dependent: :destroy

    def self.ransackable_attributes(auth_object = nil)
        %w[category_id]
    end
end
