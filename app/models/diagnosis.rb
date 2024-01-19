class Diagnosis < ApplicationRecord
    mount_uploader :desk_image, DeskImageUploader 

    validate :desk_image_must_not_be_default
    validates :place_id, presence: true
    validates :desk_work, presence: true, length: { maximum: 255 }
    validate :user_diagnosis_limit, on: :create

    belongs_to :user
    belongs_to :place

    has_many :favorites, dependent: :destroy

    def desk_image_must_not_be_default
        if desk_image.default_image?
            errors.add(:desk_image, "を選択してください。")
        end
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[desk_work id place_id] # place_category_idはここでは不要
    end

    def self.ransackable_associations(auth_object = nil)
        %w[place] # placeを検索できるようにする
    end

    private

    # 診断機能を1日2回までに制限
    def user_diagnosis_limit
        today_diagnoses = user.diagnoses.where('created_at >= ?', Time.zone.now.beginning_of_day)
        if today_diagnoses.count >= 2
            errors.add(:base, '1日の診断回数の上限に達しました。')
        end
    end
end
