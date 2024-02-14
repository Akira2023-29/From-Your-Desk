FactoryBot.define do
    factory :place do
        trait :office do
            name { "オフィス" }
        end

        trait :home do
            name { "在宅" }
        end
    end
end