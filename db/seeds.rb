# frozen_string_literal: true

Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories') # idのカウンターをリセット
Category.create!(id: 1, name: "オフィス")  # id:1
Category.create!(id: 2, name: "在宅")     # id:2

Place.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('places') # idのカウンターをリセット
Place.create!(name: "フリーアドレス", category_id: 1)
Place.create!(name: "固定席", category_id: 1)
Place.create!(name: "自室", category_id: 2)
Place.create!(name: "リビング", category_id: 2)
Place.create!(name: "ダイニング", category_id: 2)
Place.create!(name: "書斎", category_id: 2)
Place.create!(name: "その他", category_id: 2)