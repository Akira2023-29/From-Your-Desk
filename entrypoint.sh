#!/bin/bash
set -e

# Rails に対応したファイル server.pid が存在しているかもしれないので削除する。
rm -f /app/tmp/pids/server.pid

# デプロイ時にプリコンパイル、データベースのマイグレーション実行。
if [ "$RAILS_ENV" = "production" ]; then
  bundle exec rails assets:clobber
  bundle exec rails assets:precompile
  bundle exec rails db:migrate
  # bundle exec rails db:seed

  # Itemの処理
  # bundle exec rails runner -e production "Item.find_each do |item|
  #   item.item_image.recreate_versions! if item.item_image?
  # end"

  # # Diagnosisの処理
  # bundle exec rails runner -e production "Diagnosis.find_each do |diagnosis|
  #   diagnosis.desk_image.recreate_versions! if diagnosis.desk_image?
  # end"
fi

# コンテナーのプロセスを実行する。（Dockerfile 内の CMD に設定されているもの。）
exec "$@"