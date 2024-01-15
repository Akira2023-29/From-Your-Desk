class Category < ApplicationRecord
    has_many :place, dependent: :destroy
end
