# frozen_string_literal: true

# Categories
1.times do
    Category.create!(name: "オフィス")  #id:1
    Category.create!(name: "在宅")     #id:2
end

# Places
1.times do
    Place.create!(name: "フリーアドレス", category_id: 1)
    Place.create!(name: "固定席", category_id: 1)
    Place.create!(name: "自室", category_id: 2)
    Place.create!(name: "リビング", category_id: 2)
    Place.create!(name: "ダイニング", category_id: 2)
    Place.create!(name: "書斎", category_id: 2)
    Place.create!(name: "その他", category_id: 2)
end