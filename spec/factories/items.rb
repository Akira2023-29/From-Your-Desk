FactoryBot.define do
  factory :item do
    title { "題名" }
    body { "商品の説明"}
    association :user
    association :item_category

    after(:build) do |item|
      # アイテム画像を添付
      item.item_image = Rack::Test::UploadedFile.new('spec/fixtures/item_image.jpeg', 'image/jpeg')
      # 1〜3つの色をランダムに選択
      colors = FactoryBot.create_list(:color, rand(1..3))
      item.colors << colors
    end
  end
end
