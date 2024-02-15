FactoryBot.define do
    factory :color do
        trait :red do
            name { "赤" }
        end

        trait :blue do
            name { "青" }
        end

        trait :green do
            name { "緑" }
        end

        trait :white do
            name { "白" }
        end

        trait :black do
            name { "黒" }
        end
    end
end