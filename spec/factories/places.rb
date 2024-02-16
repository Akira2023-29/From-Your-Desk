FactoryBot.define do
    factory :place do
        name { "自室" }
        association :category
    end
end

        # trait :living do
        #     name { "リビング" }
        # end

        # trait :dining do
        #     name { "ダイニング" }
        # end

        # trait :other do
        #     name { "その他" }
        # end

        # trait :study do
        #     name { "書斎" }
        # end

        # trait :free_address do
        #     name { "フリーアドレス" }
        # end

        # trait :fixed_seat do
        #     name { "固定席" }
        # end
    # end
