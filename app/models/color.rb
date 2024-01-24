class Color < ApplicationRecord
    has_many :item_colors, dependent: :destroy
    has_many :items, through: :item_colors

    def self.ransackable_attributes(auth_object = nil)
        %w[id name]
    end
end