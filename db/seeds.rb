# frozen_string_literal: true

# Category.destroy_all
# ActiveRecord::Base.connection.reset_pk_sequence!('categories') # idのカウンターをリセット
# Category.create!(id: 1, name: "オフィス")  # id:1
# Category.create!(id: 2, name: "在宅")     # id:2

# Place.destroy_all
# ActiveRecord::Base.connection.reset_pk_sequence!('places') # idのカウンターをリセット
# Place.create!(name: "フリーアドレス", category_id: 1)
# Place.create!(name: "固定席", category_id: 1)
# Place.create!(name: "自室", category_id: 2)
# Place.create!(name: "リビング", category_id: 2)
# Place.create!(name: "ダイニング", category_id: 2)
# Place.create!(name: "書斎", category_id: 2)
# Place.create!(name: "その他", category_id: 2)

# # Color.all
# Color.create!([
#     { name: '赤 (Red)' },
#     { name: '青 (Blue)' },
#     { name: '黄色 (Yellow)' },
#     { name: '緑 (Green)' },
#     { name: 'オレンジ (Orange)' },
#     { name: '紫 (Purple)' },
#     { name: 'ピンク (Pink)' },
#     { name: '茶色 (Brown)' },
#     { name: '灰色 (Gray)' },
#     { name: '黒 (Black)' },
#     { name: '白 (White)' },
#     { name: '金色 (Gold)' },
#     { name: '銀色 (Silver)' },
#     { name: '水色 (Aqua)' },
#     { name: 'マゼンダ (Magenta)' },
#     { name: 'ネイビー (Navy)' },
#     { name: 'ライム (Lime)' },
#     { name: 'ベージュ (Beige)' },
#     { name: 'その他' }
# ])

# # ItemCategory.all
# ItemCategory.create!([
#     { name: 'インテリア' },
#     { name: '植物' },
#     { name: 'デスク' },
#     { name: 'チェア' },
#     { name: 'デスクトップPC' },
#     { name: 'マウス' },
#     { name: 'キーボード' },
#     { name: 'その他ガジェット類' },
#     { name: '照明器具' },
#     { name: 'その他' }
# ])

# # db/seeds.rb
# Color.group(:name).count.each do |name, count|
#     if count > 1
#         # 最初のレコードを除いて削除
#         Color.where(name: name).last(count - 1).each(&:destroy)
#     end
# end

# ItemCategory.group(:name).count.each do |name, count|
#     if count > 1
#         # 最初のレコードを除いて削除
#         ItemCategory.where(name: name).last(count - 1).each(&:destroy)
#     end
# end
