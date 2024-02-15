FactoryBot.define do
    factory :item_category do
        trait :desk do
            name { "デスク" }
        end

        trait :interior do
            name { "インテリア" }
        end

        trait :plant do
            name { "植物" }
        end
    end
end