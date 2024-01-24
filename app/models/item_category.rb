class ItemCategory < ApplicationRecord
    has_many :items

    def self.ransackable_attributes(auth_object = nil)
        %w[id name]
    end
end