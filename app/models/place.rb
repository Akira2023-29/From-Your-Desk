class Place < ApplicationRecord
    belongs_to :category
    has_many :diagnoses, dependent: :destroy

    validates :category_id, presence: true

    # 検索条件で使えるカラムを指定
    def self.ransackable_attributes(auth_object = nil)
        %w[category_id]
    end
end
